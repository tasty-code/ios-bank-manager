import Foundation


protocol Delegate: AnyObject {
    func setupDepositLabel(number: Int)
    
    func setupLoanLabel(number: Int)
    
    func changeToLabelState(tellerType: TypeOfWork,data: Int)
    
    func countReset()
    
    func timerStop()
    func removeLabel(data: Int)
}
