//
//  Created by Лев Бондаренко on 09/12/2020.
//

import UIKit

extension HomeView {
    struct Appearance {
        let exampleOffset: CGFloat = 10
    }
}

class HomeView: UIView {
    let appearance = Appearance()
    
    lazy var collectionView: UICollectionView = {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return collectionView
    }()

    fileprivate(set) lazy var customView: UIView = {
        let view = UIView()
        return view
    }()

    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        addSubviews()
        makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews(){
        addSubview(collectionView)
        
        
    }

    func makeConstraints() {
        
    }
}
