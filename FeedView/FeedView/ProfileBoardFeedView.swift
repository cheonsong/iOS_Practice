//
//  ProfileBoardFeedView.swift
//  iosRadio
//
//  Created by cheonsong on 2022/03/14.
//  Copyright © 2022 inforexIOS2. All rights reserved.
//

import Foundation
import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class ProfileBoardFeedView: UIView {
    
    var collectionList = [1,1,1,1,1,1,1,1]
    var tableList = [1,1,1,1,1,1,1]
    
    var collectionRelay: BehaviorRelay<[Int]>?
    var tableRelay: BehaviorRelay<[Int]>?
    let disposeBag = DisposeBag()
    
    // MARK: TopView 북마크, 더보기
    var topView = UIView().then {
        $0.backgroundColor = .red
    }
    
    var bookmarkView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1).cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 25 / 2
    }
    
    var bookmarkIcon = UIImageView().then {
        $0.image = UIImage(named: "bookmark")
    }
    
    var bookmarkLabel = UILabel().then {
        $0.text = "세상 아름다운님이 고정함"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 13)
        $0.textColor = UIColor(red: 32/255, green: 32/255, blue: 32/255, alpha: 1)
    }
    
    var moreButton = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.setTitleColor(UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1), for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 13)
    }
    
    // MARK: MiddleView
    var middleView = UIView().then {
        $0.backgroundColor = .yellow
    }
    
    var collectionViewLayout: UICollectionViewLayout!
    var collectionView: UICollectionView!
    
    var line = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1).cgColor
    }
    
    // MARK: BottomView
    var bottomView = UIView().then {
        $0.backgroundColor = .green
    }
    
    var tableView = UITableView().then {
        $0.register(UINib(nibName: "ProfileBoardCell", bundle: nil), forCellReuseIdentifier: "ProfileBoardCell")
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func commonInit() {
        collectionViewLayout = UICollectionViewFlowLayout().then {
            $0.itemSize = CGSize(width: 157, height: 150)
            $0.scrollDirection = .horizontal
            $0.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        }
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout).then {
            $0.backgroundColor = .white
            $0.register(ProfileBoardFeedFixCell.self, forCellWithReuseIdentifier: ProfileBoardFeedFixCell.identifier)
            $0.showsHorizontalScrollIndicator = false
        }
        
        collectionRelay = BehaviorRelay<[Int]>(value: collectionList)
        
        collectionRelay?.bind(to: collectionView.rx.items(
            cellIdentifier: ProfileBoardFeedFixCell.identifier, cellType: ProfileBoardFeedFixCell.self)
        ) { [weak self] row, element, cell in
            guard let self = self else { return }
            
            cell.timeLabel.text = "\(element)"
            
        }
        .disposed(by: disposeBag)
        
        tableRelay = BehaviorRelay<[Int]>(value: tableList)
        
        tableRelay?.bind(to: tableView.rx.items(
            cellIdentifier: "ProfileBoardCell", cellType: ProfileBoardCell.self)
        ) { row, element, cell in
            
        }
        .disposed(by: disposeBag)
        
        setUI()
        setConstraints()
    }
    
    func setUI() {
        
        addSubview(topView)
        addSubview(middleView)
        addSubview(line)
        addSubview(bottomView)
        
        topView.addSubview(bookmarkView)
        topView.addSubview(moreButton)
        
        bookmarkView.addSubview(bookmarkIcon)
        bookmarkView.addSubview(bookmarkLabel)
        
        middleView.addSubview(collectionView)
        bottomView.addSubview(tableView)
    }
    
    func setConstraints() {
        
        topView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }
        
        middleView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(157+32)
        }
        
        line.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(middleView.snp.bottom)
            $0.bottom.equalTo(bottomView.snp.top)
            $0.left.right.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(line.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
        
        bookmarkView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(5)
            $0.bottom.equalToSuperview().inset(0.5)
        }
        
        bookmarkIcon.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(3.5)
            $0.left.equalToSuperview().inset(7.5)
            $0.size.equalTo(18)
        }
        
        bookmarkLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.right.equalToSuperview().inset(8)
            $0.left.equalTo(bookmarkIcon.snp.right).offset(2)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.right.equalToSuperview().inset(16)
        }
        
        collectionView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(16)
        }
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
