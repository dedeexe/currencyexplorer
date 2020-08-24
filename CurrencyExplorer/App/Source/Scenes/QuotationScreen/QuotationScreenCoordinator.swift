import UIKit

final class QuotationScreenCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private(set) var viewController: UIViewController?

    init() {}

    func start() {
        let model = QuotationScreenModel()
        viewController = QuotationScreenViewController(model: model)
    }
}
