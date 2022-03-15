//
//  ProfileFanView.swift
//  iosRadio
//
//  Created by 인포렉스 on 2022/03/10.
//  Copyright © 2022 inforexIOS2. All rights reserved.
//

import Foundation
import UIKit
import Then
import SnapKit

class ProfileBoardView : UIView {
    
    var topView = UIView().then {
        $0.backgroundColor = .white
    }
    
    var scrollView = UIScrollView().then {
        $0.backgroundColor = .white
    }
    
    var feedButton = UIButton().then {
        $0.setTitle("피드", for: .normal)
        $0.setTitleColor(UIColor(red: 32/255, green: 32/255, blue: 32/255, alpha: 1), for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 16) ?? UIFont()
    }
    
    var fanboardButton = UIButton().then {
        $0.setTitle("팬보드", for: .normal)
        $0.setTitleColor(UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1), for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 16) ?? UIFont()
    }
    
    var clipButton = UIButton().then {
        $0.setTitle("클립", for: .normal)
        $0.setTitleColor(UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1), for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 16) ?? UIFont()
    }
    
    var addView = UIView().then {
        $0.backgroundColor = .white
    }
    
    var plusIcon = UIImageView().then {
        $0.image = UIImage(named: "plusIcon")
    }
    
    var addLabel = UILabel().then {
        $0.text = "등록"
        $0.textColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 13) ?? UIFont()
    }
    
    var feedView = ProfileBoardFeedView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        setUI()
        setConstraints()
    }

    func setUI() {
        addSubview(topView)
        addSubview(feedView)
        
        topView.addSubview(feedButton)
        topView.addSubview(fanboardButton)
        topView.addSubview(clipButton)
        topView.addSubview(addView)
        
        addView.addSubview(plusIcon)
        addView.addSubview(addLabel)
    }
    
    func setConstraints() {
        topView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        feedButton.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview()
        }
        
        fanboardButton.snp.makeConstraints {
            $0.left.equalTo(feedButton.snp.right).offset(25)
            $0.top.bottom.equalToSuperview()
        }
        
        clipButton.snp.makeConstraints {
            $0.left.equalTo(fanboardButton.snp.right).offset(25)
            $0.top.bottom.equalToSuperview()
        }
        
        addView.snp.makeConstraints {
            $0.top.bottom.right.equalToSuperview()
            $0.width.equalTo(70.5)
        }
        
        plusIcon.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(20)
            $0.left.equalToSuperview().inset(16.5)
            $0.size.equalTo(10)
        }
        
        addLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(18.5)
            $0.right.equalToSuperview().inset(15.5)
        }
        
        feedView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    deinit {
        print("ProfileBoardView deinit")
    }
}
