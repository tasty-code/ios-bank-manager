import Foundation

final class Banker: PrintableMessage {
    private(set) var customersCount = 0
    /// Banker가 초기화 될때 은행원의 업무를 지정해주기 위해 생성함.
    let service: BankingService
    
    init(service: BankingService) {
        self.service = service
    }
    
    func taskProcess(queue: Queue<Customer>)  {
        while let dequeue = queue.dequeue() {
            printStartTaskMessage(customer: dequeue)
            processTransaction(for: dequeue, with: dequeue.taskTime)
            printCompleteTaskMessage(customer: dequeue)
            customersCount += 1
        }
    }
    /// Thread.sleep를 사용하면 스레드가 멈추기 때문에 다른 작업에도 영향을 줄 수 있음
    /// 특히 main스레드에서 사용하게 되면 메인이 멈춰버림..
    /// DispatchQueue.asyncAfter를 사용하면 메인 스레드를 멈추지않고 일정한 시간 동안 대기할 수 있어서 비동기로 처리할 때 좋음
    /// DispatchQueue.asyncAfter로 리펙토링 해....ㅂ..ㄴ.,ㄴ거야..
    private func processTransaction(for customer: Customer, with processingTime: TimeInterval) {
        Thread.sleep(forTimeInterval: processingTime)
    }
    
    func resetProcessingCount() {
        customersCount = 0
    }
}
