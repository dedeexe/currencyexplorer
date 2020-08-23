import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var viewController: UIViewController? { get }
    func start()
    func remove(coordinator: Coordinator)
}

extension Coordinator {
    func remove(coordinator: Coordinator) {
        self.childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
