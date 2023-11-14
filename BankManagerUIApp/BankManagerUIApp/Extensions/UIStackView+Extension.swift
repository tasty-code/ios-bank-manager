import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment = .fill, spacing: CGFloat = 8, arrangedSubviews: [UIView] = []) {
        self.init()
        
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        
        arrangedSubviews.forEach {
            self.addArrangedSubview($0)
        }
        
        self.isLayoutMarginsRelativeArrangement = false
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
