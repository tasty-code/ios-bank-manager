import Foundation

struct Bank {
    let bankEmployeeCount: Int
    let customerWaitingList: Queue = Queue<Int>()
    let customerCount: Int = Int.random(in: 10...30)
    var time: Double = 0.0
    
    func formatTimeToTwoDecimalPlaces(_ time: Double) -> Double {
        return Double(String(format: "%.2f", time)) ?? 0.0
    }
    
    mutating func startBank() {
        
        print("1 : 은행 개점")
        print("2 : 종료")
        
        guard let userInput = readLine() else {
            return
        }
        
        switch userInput {
        case "1":
            for number in 0...customerCount {
                customerWaitingList.enqueue(data: number)
                
            }
            
            for number in 0...customerCount {
                print("\(number)번 고객 업무 시작")
                time += 0.7
                customerWaitingList.dequeue()
                print("\(number)번 고객 업무 종료")
            }
            
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총  \(customerCount)명이며, 총 업무시간은 \(formatTimeToTwoDecimalPlaces(time))초입니다.")
            
            break
        case "2":break
            
        default:
            break
        }
        

        
        
        
    }
}
