//
//  Created by Лев Бондаренко on 09/12/2020.
//

protocol HomeServiceProtocol {
    func fetchItems(completion: @escaping ([HomeModel]?, Error?) -> Void)
}

/// Получает данные для модуля Home
class HomeService: HomeServiceProtocol {

    func fetchItems(completion: @escaping ([HomeModel]?, Error?) -> Void) {
        completion(nil, nil)
    }
}
