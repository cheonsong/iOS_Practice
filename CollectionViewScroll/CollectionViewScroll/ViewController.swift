//
//  ViewController.swift
//  Skeleton
//
//  Created by cheonsong on 2022/03/07.
//

import UIKit

class ViewController: UIViewController {
    
    
    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout = UICollectionViewFlowLayout().then {
            $0.minimumLineSpacing = 0
            $0.scrollDirection = .vertical
            $0.sectionInset = .zero
            $0.itemSize = CGSize(width: self.view.bounds.width - 40, height: self.view.bounds.height/2)
        }
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.backgroundColor = .clear
            $0.register(FirstCell.self, forCellWithReuseIdentifier: FirstCell.identifier)
            $0.register(SecondCell.self, forCellWithReuseIdentifier: SecondCell.identifier)
            $0.showsVerticalScrollIndicator = false
        }
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if indexPath.section == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCell", for: indexPath)
        } else if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCell", for: indexPath)
        }
        
        return cell
    }
    
}
