//
//  Home module
//  Created by Лев Бондаренко on 09/12/2020.
//

import UIKit

class HomeBuilder: ModuleBuilder {

    var initialState: Home.ViewControllerState?

    func set(initialState: Home.ViewControllerState) -> HomeBuilder {
        self.initialState = initialState
        return self
    } 

    func build() -> UIViewController {
        let presenter = HomePresenter()
        let interactor = HomeInteractor(presenter: presenter)
        let controller = HomeViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
