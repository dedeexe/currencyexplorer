import UIKit

class AppCoordinator: Coordinator {
    private var controller: UIViewController?
    private unowned let window: UIWindow

    private(set) var viewController: UIViewController?
    var childCoordinators: [Coordinator] = []

    init (window: UIWindow) {
        self.window = window
    }

    func start() {
        let coordinator = QuotationScreenCoordinator()
        coordinator.start()
        window.rootViewController = coordinator.viewController
        window.makeKeyAndVisible()
    }
}
