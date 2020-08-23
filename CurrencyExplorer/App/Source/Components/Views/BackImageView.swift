import UIKit

class BackImageView: UIView {

    private let backImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var image: UIImage? = nil {
        didSet {
            backImageView.image = image ?? Asset.Image.placeholder.resource
        }
    }

    init() {
        super.init(frame: .zero)
        addComponents()
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addComponents() {
        addSubview(backImageView)
    }

    private func setupLayout() {
        backImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        backImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}
