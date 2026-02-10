import UIKit

class RootView: UIView, UIGestureRecognizerDelegate {

    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .secondarySystemBackground
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Title"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    private let contentTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Content"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    private lazy var updateButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Update UI", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 15.0
        btn.addTarget(self, action: #selector(didTapUpdate), for: .touchUpInside)
        return btn
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleTextField, contentTextField, updateButton])
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    private func setupLayout() {
        backgroundColor = .systemBackground
        
        addSubview(headerView)
        headerView.addSubview(titleLabel)
        
        addSubview(scrollView)
        scrollView.addSubview(contentLabel)
        
        addSubview(fieldView)
        fieldView.addSubview(bottomStackView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        
        tap.delegate = self
        addGestureRecognizer(tap)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60),
            
            titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            fieldView.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor),
            fieldView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fieldView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bottomStackView.topAnchor.constraint(equalTo: fieldView.topAnchor, constant: 16),
            bottomStackView.bottomAnchor.constraint(equalTo: fieldView.bottomAnchor, constant: -16),
            bottomStackView.leadingAnchor.constraint(equalTo: fieldView.leadingAnchor, constant: 20),
            bottomStackView.trailingAnchor.constraint(equalTo: fieldView.trailingAnchor, constant: -20),
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: fieldView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            contentLabel.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 20),
            contentLabel.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -20),
            contentLabel.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20),
            contentLabel.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -20),
            contentLabel.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -40)
        ])
    }
    
    public func configure(withTitle title: String, withContent content: String) {
        titleLabel.text = title
        contentLabel.text = content
    }
    
    @objc private func didTapUpdate() {
        if let newTitle = titleTextField.text, !newTitle.isEmpty {
            titleLabel.text = newTitle
        }
        
        if let newContent = contentTextField.text, !newContent.isEmpty {
            contentLabel.text = newContent
        }
        
        endEditing(true)
    }
    
    @objc private func dismissKeyboard() {
        endEditing(true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view?.isDescendant(of: fieldView) == true {
            return false
        }
        
        return true
    }
}
