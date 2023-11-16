protocol BankerDelegate: AnyObject {
    func addWorkingStackView(_ banker: Banker, _ customer: Customer)
    func deleteWorkingStackView(_ banker: Banker, _ customer: Customer)
}
