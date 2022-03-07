//
//  CustomCell.swift
//  Skeleton
//
//  Created by cheonsong on 2022/03/07.
//

import Foundation
import UIKit
import Then
import SnapKit
import SkeletonView

class CustomCell: UICollectionViewCell {
    
    static let identifier = "CustomCell"
    
    var imageView = UIView().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
    }
    
    var label = UILabel().then {
        $0.text = "TestTestTest"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func commonInit() {
        addComponents()
        setConstraint()
        skeletonInit()
    }
    
    func addComponents() {
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }
    
    func setConstraint() {
        imageView.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview().inset(10)
        }
        
        label.snp.makeConstraints {
            $0.left.equalTo(imageView.snp.right).offset(15)
            $0.top.right.equalToSuperview().inset(10)
        }
    }
    
    func skeletonInit() {
        self.isSkeletonable = true
        imageView.isSkeletonable = true
        label.isSkeletonable = true
        
        imageView.skeletonCornerRadius = 10
        label.linesCornerRadius = 5
        
        label.numberOfLines = 10
        label.lastLineFillPercent = 100
    }
}
