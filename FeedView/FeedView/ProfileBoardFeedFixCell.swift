//
//  ProfileBoardFeedCell.swift
//  iosRadio
//
//  Created by cheonsong on 2022/03/14.
//  Copyright © 2022 inforexIOS2. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Then

class ProfileBoardFeedFixCell: UICollectionViewCell {
    
    static let identifier = "ProfileBoardFeedFixCell"
    
    var view = UIView().then {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 10
    }
    
    var noticeLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansKR-Medium", size: 17)
        $0.text = "정규 매일 저녁 7시 또는 7시 반ㄲㄱㄹㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲ"
        $0.textColor = .black
        $0.numberOfLines = 4
    }
    
    var timeLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        $0.text = "3시간 전"
        $0.textColor = .black
    }
    
    var image = UIImageView().then {
        $0.layer.cornerRadius = 5
    }
    
    var imageCountLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 17)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    private func commonInit() {
        setUI()
        setConstraints()
    }
    
    func setUI() {
        contentView.addSubview(view)
        view.addSubview(noticeLabel)
        view.addSubview(timeLabel)
        view.addSubview(image)
        image.addSubview(imageCountLabel)
    }
    
    func setConstraints() {
        view.snp.makeConstraints {
            $0.width.equalTo(157)
            $0.height.equalTo(150)
            $0.edges.equalToSuperview()
        }
        
        noticeLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(24)
        }
        
        timeLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(12)
        }
        
        image.snp.makeConstraints {
            $0.right.bottom.equalToSuperview().inset(12)
            $0.size.equalTo(42)
        }
        
        imageCountLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}
