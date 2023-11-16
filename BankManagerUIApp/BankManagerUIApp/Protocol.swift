
import UIKit


protocol BankUIDelegate: AnyObject {
    func addTaskLabel(type: TypeOfWork, number: Int, textColor: UIColor)
    
    func changeToLabelState(tellerType: TypeOfWork,data: Int)
    
    func removeLabel(data: Int)
}


