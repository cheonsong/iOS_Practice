//
//  ViewController.swift
//  Skeleton
//
//  Created by cheonsong on 2022/03/07.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {
    
    var dataList: [String] = ["test1", "test2", "test3", "test4", "test5", "test6"]
    var collectionView: UICollectionView!
    var layout = UICollectionViewFlowLayout().then {
        $0.minimumLineSpacing = 0
        $0.scrollDirection = .horizontal
        $0.sectionInset = .zero
    }
    var button = UIButton().then {
        $0.setTitle("reload", for: .normal)
        $0.backgroundColor = .clouds
        $0.setTitleColor(.black, for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.backgroundColor = .clear
            $0.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        }
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.left.top.right.equalTo(view.safeAreaLayoutGuide)
        }
        self.view.addSubview(button)
        button.snp.makeConstraints {
            $0.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(collectionView.snp.bottom)
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.isSkeletonable = true
        collectionView.showSkeleton(usingColor: .clouds, transition: .crossDissolve(0.4))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.collectionView.stopSkeletonAnimation()
            self.collectionView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.4))
        })
        
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
    }
    
    @objc func tap() {
        collectionView.showSkeleton(usingColor: .clouds, transition: .crossDissolve(0.4))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.collectionView.stopSkeletonAnimation()
            self.collectionView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.4))
        })
    }


}

extension ViewController: SkeletonCollectionViewDelegate, SkeletonCollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "CustomCell"
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UICollectionView.automaticNumberOfSkeletonItems
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.imageView.backgroundColor = .yellow
        cell.label.text = dataList[indexPath.row]
        
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 10*3)
        return CGSize(width: width / 2, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}
