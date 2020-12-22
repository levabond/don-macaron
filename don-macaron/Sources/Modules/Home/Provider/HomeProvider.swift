//
//  Created by Лев Бондаренко on 09/12/2020.
//

protocol HomeProviderProtocol {
    func getItems(completion: @escaping ([HomeModel]?, HomeProviderError?) -> Void)
}

enum HomeProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}

/// Отвечает за получение данных модуля Home
struct HomeProvider: HomeProviderProtocol {
    let dataStore: HomeDataStore
    let service: HomeServiceProtocol

    init(dataStore: HomeDataStore = HomeDataStore(), service: HomeServiceProtocol = HomeService()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping ([HomeModel]?, HomeProviderError?) -> Void) {
        if dataStore.models?.isEmpty == false {
            return completion(self.dataStore.models, nil)
        }
        service.fetchItems { (array, error) in
            if let error = error {
                completion(nil, .getItemsFailed(underlyingError: error))
            } else if let models = array {
                self.dataStore.models = models
                completion(self.dataStore.models, nil)
            }
        }
    }
}
