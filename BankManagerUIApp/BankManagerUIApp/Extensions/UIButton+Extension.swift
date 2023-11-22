import UIKit

extension UIButton {
    convenience init(title: String, titleColor: UIColor = .black, backgroundColor: UIColor = .white) {
        self.init()
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentHorizontalAlignment = .center
    }
}
