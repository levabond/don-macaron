//
//  Home module
//  Created by Лев Бондаренко on 09/12/2020.
//

enum Home {
    // MARK: Use cases
    enum Something {
        struct Request {
        }

        struct Response {
            var result: HomeRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum HomeRequestResult {
        case failure(HomeError)
        case success([HomeModel])
    }

    enum ViewControllerState {
        case loading
        case result([Any/*viewModel*/])
        case emptyResult
        case error(message: String)
    }

    enum HomeError: Error {
        case someError(message: String)
    }
}
