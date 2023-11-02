import Foundation


class BankManager {
    var bank = Bank()
    var isRunning: Bool = false
    var entranceCount: Int = 0
    var exitCount: Int = 0

    func run() {
        getCustomerCount()
        isRunning = true
        
        while isRunning {
            getCustomerCount()
            print("1: 실행, 2: 종료")
            
            if let userInput = readLine() {
                switch userInput {
                case "1":
                    start()
                    
                case "2":
                    exit()
                    
                default:
                    return
                }
            }
        }
    }
    
    func exit() {
        isRunning = false
    }
    
    func start() {
        setQueue()
        mainWork()
    }
    
    func setQueue() {
        for i in 1...entranceCount {
            bank.waitingList.enqueue(Customer(ticketNumber: i))
        }
    }
    
    func getCustomerCount() {
        entranceCount = Int.random(in: 5...10)
    }
    
    func clear() {
        entranceCount = 0
        exitCount = 0
    }
    
    func mainWork() {
        let queue = DispatchQueue(label: "worker")
        let group = DispatchGroup()
        
        while entranceCount > exitCount {
            guard let frontCustomer = bank.waitingList.dequeue() else { break }
            
            queue.async(group: group) { [weak self] in
                self?.work(target: frontCustomer)
            }
        }
        group.wait()
        exitMainWork()
    }
    
    func exitMainWork() {
        bank.isOpen = false
        print("업무가 마감되었습니다. 오늘 처리한 고객은 총 \(entranceCount)명이며, 총 업무시간은 \(String(format: "%.2f", Double(entranceCount) * 0.7))초 입니다")
        clear()
    }
    
    func work(target: Customer) {
        print("\(target.ticketNumber)번 업무 시작")
        sleep(UInt32(0.7))

        print("\(target.ticketNumber)번 업무 종료")
        exitCount += 1
    }
}
