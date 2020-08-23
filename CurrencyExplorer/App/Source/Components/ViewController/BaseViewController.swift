import UIKit

class BaseViewController<View: UIView>: UIViewController {
    let internalView: View

    init(view: View) {
        internalView = view
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = internalView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
