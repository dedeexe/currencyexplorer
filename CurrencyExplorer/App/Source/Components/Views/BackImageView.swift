import UIKit

class BackgroundView: UIView {

    private let backImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()

    private let gradientView: UIView = {
        let view = UIView()
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

    override func layoutSubviews() {
        super.layoutSubviews()
        createGradient()
    }

    private func addComponents() {
        addSubview(backImageView)
        addSubview(gradientView)
    }

    private func setupLayout() {
        backImageView.alignEdgesTo(view: self)
        gradientView.alignEdgesTo(view: self)
        layer.cornerRadius = 16
        layer.masksToBounds = true
        image = nil
    }

    private func createGradient() {
//        let gradient = CAGradientLayer()
//        gradient.colors = [
//            UIColor.black.withAlphaComponent(0.4),
//            UIColor.black.withAlphaComponent(0.7),
//            UIColor.black.withAlphaComponent(0.8),
//        ]
//
//        gradient.frame = gradientView.frame
//        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
//        gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
//
//        gradient.locations = [0.0, 0.7, 0.9]
//        gradientView.layer.insertSublayer(gradient, at: 0)

        gradientView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
}
