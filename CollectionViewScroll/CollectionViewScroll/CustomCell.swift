//
//  CustomCell.swift
//  CollectionViewScroll
//
//  Created by cheonsong on 2022/03/07.
//

import Foundation
import UIKit
import SnapKit
import Then

class FirstCell: UICollectionViewCell {
    
    var image = UIView().then {
        $0.backgroundColor = .yellow
        $0.layer.cornerRadius = 10
    }
    
    static let identifier = "FirstCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(image)
        image.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

class SecondCell: UICollectionViewCell {
    
    
    
    static let identifier = "SecondCell"
    
    var layout: UICollectionViewFlowLayout!
    
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout = UICollectionViewFlowLayout().then {
            $0.minimumLineSpacing = 0
            $0.scrollDirection = .vertical
            $0.sectionInset = .zero
            $0.itemSize = CGSize(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.width / 2)
        }
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout).then {
            $0.backgroundColor = .clear
            $0.register(FirstCell.self, forCellWithReuseIdentifier: FirstCell.identifier)
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension SecondCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCell", for: indexPath) as! FirstCell
        
        cell.image.backgroundColor = .blue
        return cell
    }
    
    
}
