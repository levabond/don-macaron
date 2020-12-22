//
//  Home module
//  Created by Лев Бондаренко on 09/12/2020.
//

import UIKit

protocol HomeDisplayLogic: class {
    func displaySomething(viewModel: Home.Something.ViewModel)
}

class HomeViewController: UIViewController {
    let interactor: HomeBusinessLogic
    var state: Home.ViewControllerState

    init(interactor: HomeBusinessLogic, initialState: Home.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        let view = HomeView(frame: UIScreen.main.bounds)
        self.view = view
        // make additional setup of view or save references to subviews
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }

    // MARK: Do something
    func doSomething() {
        let request = Home.Something.Request()
        interactor.doSomething(request: request)
    }
}

extension HomeViewController: HomeDisplayLogic {
    func displaySomething(viewModel: Home.Something.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: Home.ViewControllerState) {
        state = newState
        switch state {
        case .loading:
            print("loading...")
        case let .error(message):
            print("error \(message)")
        case let .result(items):
            print("result: \(items)")
        case .emptyResult:
            print("empty result")
        }
    }
}
