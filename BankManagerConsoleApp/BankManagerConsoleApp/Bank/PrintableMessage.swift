protocol PrintableMessage { }

extension PrintableMessage where Self: Banker {
    func printStartTaskMessage(customer: Customer) {
        print("\(customer.waitingNumber)번 고객 업무 시작")
    }
    func printCompleteTaskMessage(customer: Customer) {
        print("\(customer.waitingNumber)번 고객 업무 완료")
    }
    func printClosingMessage(customersCount: Int, totalProcessingTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customersCount)명이며, 총 업무시간은 \(String(format: "%.2f", totalProcessingTime))초입니다.")
    }
}
