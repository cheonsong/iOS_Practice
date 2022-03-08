//
//  ViewController.swift
//  Skeleton
//
//  Created by cheonsong on 2022/03/07.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {
    
    var currentIndex: CGFloat = 0
    var dataList: [String] = []
    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!
    var button = UIButton().then {
        $0.setTitle("reload", for: .normal)
        $0.backgroundColor = .clouds
        $0.setTitleColor(.black, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (1...12).forEach {
            dataList.append("\($0) \($0) \($0) \($0) \($0) \($0) \($0) \($0) \($0) \($0) \($0) \($0) \($0) \($0) \($0) ")
        }
        
        layout = UICollectionViewFlowLayout().then {
            $0.itemSize = CGSize(width: view.bounds.width - 40, height: view.bounds.height / 3.7)
            $0.minimumLineSpacing = 10
            $0.scrollDirection = .horizontal
            $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40)
        }
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.backgroundColor = .clear
            $0.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
            $0.showsHorizontalScrollIndicator = false
            $0.dataSource = self
            $0.delegate = self
            $0.isSkeletonable = true
            $0.decelerationRate = .fast
            $0.isPagingEnabled = false
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
        
        
        collectionView.showAnimatedSkeleton(usingColor: .clouds, transition: .crossDissolve(0.4))
        
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
    }
    
    @objc func tap() {
        collectionView.showAnimatedSkeleton(usingColor: .clouds, animation: nil, transition: .crossDissolve(0.4))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.collectionView.stopSkeletonAnimation()
            self.collectionView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.4))
        })
    }
    
    
}

extension ViewController: SkeletonCollectionViewDelegate, SkeletonCollectionViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "CustomCell"
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
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
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
        let index: Int
        if velocity.x > 0 {
            index = Int(ceil(estimatedIndex))
        } else if velocity.x < 0 {
            index = Int(floor(estimatedIndex))
        } else {
            index = Int(round(estimatedIndex))
        }
        
        targetContentOffset.pointee = CGPoint(x: CGFloat(index) * cellWidthIncludingSpacing, y: 0)
    }
    
}
