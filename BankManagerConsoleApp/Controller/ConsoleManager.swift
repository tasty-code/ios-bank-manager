
import Foundation

struct ConsoleManager {
    private var isOpen: Bool = false
    private var customerManager: CustomerManager = CustomerManager()
    private var bankManager: BankManager = BankManager()
    
    mutating func operate() {
        isOpen = false
        printMenuOfBank()
        
        do {
            let input = try selectedByUser()
            isOpen = doorTrigger(by: input)
        } catch {
            print(error.localizedDescription)
            operate()
        }

        while isOpen {
            executeBankingOperation()
        }
    }
    
    private func doorTrigger(by input: String) -> Bool {
        if input == "1" {
            return true
        } else {
            print("종료되었습니다.")
            return false
        }
    }

    private mutating func executeBankingOperation() {
            customerManager.resetCustomer()  // 폐점할 때 리셋하는 것으로 변경하자
            bankManager.createEmployees()
            customerManager.createCustomers()
            customerManager.registerCustomers()
        
            let group = DispatchGroup()
            let 세마폴 = DispatchSemaphore(value: 1)
            var mutableCustomerManager = self.customerManager
        
            let threadSleepStart = Date.timeIntervalSinceReferenceDate
            bankManager.은행원1?.async(group: group) {
                while !mutableCustomerManager.loanTicketMachine.isEmpty {
                    guard let 고객 = mutableCustomerManager.loanTicketMachine.dequeue() else { return }
                    print("\(고객.ticketNumber)번 고객 \(고객.task)업무 시작")
                    Thread.sleep(forTimeInterval: 1.1) 
                    print("\(고객.ticketNumber)번 고객 \(고객.task)업무 종료")
                }
            }
        
            bankManager.은행원2?.async(group: group) {
                while !mutableCustomerManager.depositTicketMachine.isEmpty {
                    세마폴.wait()
                    guard let 고객 = mutableCustomerManager.depositTicketMachine.dequeue() else { return }
                    세마폴.signal()
                    
                    print("\(고객.ticketNumber)번 고객 \(고객.task)업무 시작")
                    Thread.sleep(forTimeInterval: 0.7) // 처리에 소요되는 시간을 측정하는 메서드
                    print("\(고객.ticketNumber)번 고객 \(고객.task)업무 종료")
                }
            }
        
            bankManager.은행원3?.async(group: group) {
                while !mutableCustomerManager.depositTicketMachine.isEmpty {
                    세마폴.wait()
                    guard let 고객 = mutableCustomerManager.depositTicketMachine.dequeue() else { return }
                    세마폴.signal()
                    
                    print("\(고객.ticketNumber)번 고객 \(고객.task)업무 시작")
                    Thread.sleep(forTimeInterval: 0.7) // 처리에 소요되는 시간을 측정하는 메서드
                    print("\(고객.ticketNumber)번 고객 \(고객.task)업무 종료")
                }
            }
            group.wait()
            let threadSleepEnd = Date.timeIntervalSinceReferenceDate
            let totalTime = threadSleepEnd - threadSleepStart
            let convertedTotalTime = String(format: "%.2f", totalTime)
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerManager.customers.count)명이며, 총 업무시간은 \(convertedTotalTime) 입니다.")
            operate()
    }
    
    private func selectedByUser() throws -> String {
        guard let input = readLine(), input == "1" || input == "2" else {
            throw InputError.wrongInput
        }
        return input
    }
    
    private func printMenuOfBank() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
}
