import UIKit

class BackImageView: UIView {

    private let backImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
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
        backImageView.alignEdgesTo(view: self)
        layer.cornerRadius = 16
        layer.masksToBounds = true
        image = nil
    }
}
