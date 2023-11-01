import Foundation

final class BankManager<T> {
    private var queues: [Int: Queue<T>]
    private var bankers: [Banker<T>]
    
    init(queues: [Int: Queue<T>] = [:], bankers: [Banker<T>] = [] ) {
        self.queues = queues
        self.bankers = bankers
    }

    func startWork() {
        guard let queue = queues[0] else {
            return
        }
        
        for banker in bankers {
            if banker.task == "예금" {
                banker.takeTask(queue)
            }
        }
    }
    
    func makeQueue() {
        let queue: Queue<T> = Queue<T>()
        queues[queues.count] = queue
        
    }
    
    func getQueue(index: Int) -> Queue<T>? {
        if queues.count > 0 {
            return queues[index]
        } else {
            return nil
        }
    }
    
    func hireBanker(task: String) {
        let banker: Banker<T> = Banker(id: bankers.count, task: task)
        bankers.append(banker)
    }
    
    func run() {
        while true {
            
            print("1 : 은행 개점")
            print("2 : 종료")
            
            guard let input = readLine(), let input = Int(input) else {
                break
            }
            
            if input == 1 {
                makeQueue()
                hireBanker(task: Task.deposit.description)
                let queue = getQueue(index: 0)
                
                let peopleCount = Int.random(in: 10...30)
                let cost = round(Double(peopleCount) * 0.7 * 100) / 100
                for index in 1...peopleCount {
                    queue?.enqueue(Node(data: index as! T))
                }
                for _ in 1...peopleCount {
                    startWork()
                }
                
                print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(peopleCount)명이며, 총 업무시간은 \(cost) 초 입니다.")
            } else if input == 2{
                break
            }

        }
    }
}
