
import UIKit

class CustomCell: UITableViewCell {
    static var className: String { String(describing: self) }
    
    private var label:  UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.contentView.heightAnchor.constraint(equalTo: label.heightAnchor, multiplier: 1.1).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabelText(customerNumber: Int, serviceType: String) {
        self.label.text = "\(customerNumber) - \(serviceType)"
    }
    
    func setLabelColor(_ color: UIColor) {
        self.label.textColor = color
    }
}
