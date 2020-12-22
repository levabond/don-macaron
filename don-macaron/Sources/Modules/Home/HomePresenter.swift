//
//  Home module
//  Created by Лев Бондаренко on 09/12/2020.
//

import UIKit

protocol HomePresentationLogic {
    func presentSomething(response: Home.Something.Response)
}

/// Отвечает за отображение данных модуля Home
class HomePresenter: HomePresentationLogic {
    weak var viewController: HomeDisplayLogic?

    // MARK: Do something
    func presentSomething(response: Home.Something.Response) {
        var viewModel: Home.Something.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = Home.Something.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.isEmpty {
                viewModel = Home.Something.ViewModel(state: .emptyResult)
            } else {
                viewModel = Home.Something.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displaySomething(viewModel: viewModel)
    }
}
