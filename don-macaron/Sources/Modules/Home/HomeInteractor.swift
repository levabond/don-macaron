//
//  Home module
//  Created by Лев Бондаренко on 09/12/2020.
//

protocol HomeBusinessLogic {
    func doSomething(request: Home.Something.Request)
}

/// Класс для описания бизнес-логики модуля Home
class HomeInteractor: HomeBusinessLogic {
    let presenter: HomePresentationLogic
    let provider: HomeProviderProtocol

    init(presenter: HomePresentationLogic, provider: HomeProviderProtocol = HomeProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Do something
    func doSomething(request: Home.Something.Request) {
        provider.getItems { (items, error) in
            let result: Home.HomeRequestResult
            if let items = items {
                result = .success(items)
            } else if let error = error {
                result = .failure(.someError(message: error.localizedDescription))
            } else {
                result = .failure(.someError(message: "No Data"))
            }
            self.presenter.presentSomething(response: Home.Something.Response(result: result))
        }
    }
}
