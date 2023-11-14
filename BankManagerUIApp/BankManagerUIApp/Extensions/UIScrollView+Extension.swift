import UIKit

extension UIScrollView {
    convenience init(subView: UIView, isScrollEnabled: Bool = true) {
        self.init()
    
        self.addSubview(subView)
    
        self.translatesAutoresizingMaskIntoConstraints = false
        self.showsVerticalScrollIndicator = false
        self.isScrollEnabled = isScrollEnabled
    }
}
