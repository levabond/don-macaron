//
//  Created by Лев Бондаренко on 09/12/2020.
//

/// Модель данных, описывающая ...
struct HomeModel: UniqueIdentifiable {
    // Example
    let uid: UniqueIdentifier
    let name: String
}

extension HomeModel: Equatable {
    static func == (lhs: HomeModel, rhs: HomeModel) -> Bool {
        return lhs.uid == rhs.uid
    }
}
