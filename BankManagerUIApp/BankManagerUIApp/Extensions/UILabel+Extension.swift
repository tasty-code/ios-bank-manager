import UIKit

extension UILabel {
    convenience init(text: String, fontSize: CGFloat = 10, textColor: UIColor, backgroundColor: UIColor = .white) {
        self.init()
        
        self.text = text
        self.font = .systemFont(ofSize: fontSize)
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.textAlignment = .center
        self.numberOfLines = 0
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
