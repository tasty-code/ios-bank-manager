protocol BankDelegate: AnyObject {
    func addWaitingStackView(_ bank: Bank, _ customer: Customer)
}
