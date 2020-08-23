import UIKit

class QuotationScreenCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private(set) var viewController: UIViewController?

    init() {}

    func start() {
        viewController = QuotationScreenViewController()
    }
}
