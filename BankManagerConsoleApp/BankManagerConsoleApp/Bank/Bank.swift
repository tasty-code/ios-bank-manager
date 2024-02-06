import Foundation

final class Bank: PrintableMessage {
    /// 필요한 은행원이 3명이라서 배열로 구현했고
    /// 초기화할 때 각 은행원이 맡을 업무 지정해 줄거임.
    private var bankers: [Banker]
    /// 업무별로 큐를 생성해야해서 딕셔너리로 구현함.
    private var customersQueue: [BankingService: Queue<Customer>] = [:]
    /// 예금을 처리하는 은행원이 2명이라서 동시에 큐에 접근했을때 결과가 요상해짐.
    /// 한 번에 한 개의 접근만 할 수 있게 하기 위해서
    /// 예금처리를 위한 세마포어를 만들었고
    /// Bank를 초기화할때 main에서 세마포어 수 2로 지정해 줄거임
    private let depositSemaphore: DispatchSemaphore
    /// 디스패치큐 작업을 그룹으로 묶어서 진행하기 위해서 생성함
    let group = DispatchGroup()
    
    init(bankers: [Banker], depositSemaphore: DispatchSemaphore) {
        self.bankers = bankers
        self.depositSemaphore = depositSemaphore
        /// 모든 은행 업무에 대한 큐 초기화함.
        for service in BankingService.allCases {
            customersQueue[service] = Queue<Customer>()
        }
    }
    
    func openBank() {            
        let taskStartedTime: Date = Date()
        generateCustomerQueue()
        
        /// 각 은행원에 대해 병렬 처리
        for banker in bankers {
            /// 비동기 작업 시작!
            /// 그룹에 작업이 추가될 때마다 호출됨
            group.enter()
            DispatchQueue.global().async {
                switch banker.service {
                    /// 예금업무는 세마포어를 사용해서 동시 접근을 제어함
                case .deposit:
                    /// 스레드가 세마포어에 진입하는 단계
                    /// 세마포어의 값을 1 감소시킴
                    /// 만약 세마포어 값이 0 이하면 대기상태가 됨
                    self.depositSemaphore.wait()
                    if let depositQueue = self.customersQueue[.deposit] {
                        banker.taskProcess(queue: depositQueue)
                    }
                    /// 세마포어에서 탈출함.
                    /// 세마포어의 값을 1 증가시킴
                    /// 다른 스레드들이 대기 중인 세마포어에 들어갈 수 있게 해줌
                    /// 즉 다음 예금업무를 처리할 스레드에게 턴을 넘겨준다? 뭐 그런느낌?
                    /// 첫 번째 예금 은행원이 먼저 세마포어에 진입해서 할당받은 하나의 업무를 처리하고 나오면
                    /// 두 번째 예금 은행원이 세마포어에 진입할 수 있는것!
                    self.depositSemaphore.signal()
                case .loan:
                    if let loanQueue = self.customersQueue[.loan] {
                        banker.taskProcess(queue: loanQueue)
                    }
                }
                /// 비동기 작업의 완료!
                /// 그룹에 속한 작업의 수를 감소시키며, 그룹에 더 이상 대기 중인 작업이 없으면 완료된 것으로 간주
                self.group.leave()
            }
        }
        /// 모든 비동기 작업이 완료될 때까지 대기
        /// wait() 메서드는 현재 스레드를 차단하므로, 주로 비동기적 작업을
        /// 수행하는 메인 스레드가 아닌 다른 스레드에서 호출해야 함!
        group.wait()
        closeBank(totalProcessingTime: Date().timeIntervalSince(taskStartedTime))
    }
    
    private func generateCustomerQueue() {
        let waitingNumber = Int.random(in: 29...30)
        for num in 1...waitingNumber {
            /// 3의 배수인 경우 대출 업무로 고객 생성
            /// 아닌 경우 예금 업무로 고객 생성
            let randomTaskTime = BankingService.randomBankingService
            /// 업무 별로 큐에 고객 추가
            if let queue = customersQueue[randomTaskTime] {
                queue.enqueue(value: Customer(waitingNumber: num, taskType: randomTaskTime))
            }
        }
    }
    
    private func closeBank(totalProcessingTime: Double) {
        let totalCustomersCount = bankers.reduce(0) { $0 + $1.customersCount }
        
        printClosingMessage(customersCount: totalCustomersCount, totalProcessingTime: totalProcessingTime)
        resetBankers()
    }
    
    private func resetBankers() {
        for banker in bankers {
            banker.resetProcessingCount()
        }
    }
}
