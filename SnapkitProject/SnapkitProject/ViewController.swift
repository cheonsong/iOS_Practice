//
//  ViewController.swift
//  SnapkitProject
//
//  Created by cheonsong on 2022/02/04.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let colorManager = ColorManager.instance
    let fontManager = FontManager.instance
    
    // Top + Bottom
    lazy var superView       : UIView = {
       let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    // Top
    var topView         : UIView!
    var topLabel        : UILabel!
    var storyCountLabel : UILabel!
    var descriptionLabel: UILabel!
    var downButton      : UIButton!
    // Bottom
    var bottomView      : UIView!
    var storySuperView  : UIView!
    var storyTextView   : UITextView!
    var sendButton      : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setUI()
        addView()
        setConstraint()
        
    }
    
    func addView() {
        view.addSubview(superView)
        superView.addSubview(topView)
        superView.addSubview(bottomView)
        
        topView.addSubview(topLabel)
        topView.addSubview(storyCountLabel)
        topView.addSubview(descriptionLabel)
        topView.addSubview(downButton)
        
        [topLabel, storyCountLabel, descriptionLabel, downButton].forEach {
            topView.addSubview($0)
        }
        
        bottomView.addSubview(storySuperView)
        bottomView.addSubview(sendButton)
        storySuperView.addSubview(storyTextView)
        
    }
    
    func setUI() {
        superView = UIView().then {
            $0.backgroundColor = .white
        }
        
        //  ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ Top ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
        topView = UIView().then {
            $0.backgroundColor = .white
        }
        
        topLabel = UILabel().then {
            $0.textColor = .black
            $0.font = fontManager.notoSansKR(.bold, 18)
            $0.text = "사연 보내기"
        }
        
        storyCountLabel = UILabel().then {
            $0.text = "(0/300)"
            $0.font = fontManager.notoSansKR(.regular, 13)
            $0.textColor = colorManager.color102
        }
        
        descriptionLabel = UILabel().then {
            $0.text = "듣고싶은 신청곡, 전하고싶은 사연을 BJ에게 전달해보세요. 음란, 비방, 폭언 시 영구정지 될 수 있습니다."
            $0.numberOfLines = 0
            $0.font = fontManager.notoSansKR(.regular, 13)
            $0.textColor = colorManager.color102
        }
        
        downButton = UIButton().then {
            $0.setImage(UIImage(named: "DownButton"), for: .normal)
        }
        //  ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ Top ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
        
        // ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ Bottom ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
        bottomView = UIView().then {
            $0.backgroundColor = .white
        }
        
        storySuperView = UIView().then {
            $0.backgroundColor = colorManager.color238
            $0.layer.cornerRadius = 5
        }
        
        storyTextView = UITextView().then {
            $0.backgroundColor = colorManager.color238
            $0.font = fontManager.notoSansKR(.regular, 14)
            $0.textColor = colorManager.color102
            $0.text = "10자 이상 300자 이내로 작성해주세요."
        }
        
        sendButton = UIButton(type: .custom).then {
            $0.backgroundColor = colorManager.color203
            $0.setTitle("보내기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.frame.size = CGSize(width: 102, height: 38)
            $0.layer.cornerRadius = $0.frame.height / 2
        }
        // ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ Bottom ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
    }//$0.frame.size = CGSize(width: 102, height: 38)

    func setConstraint() {
        superView.snp.makeConstraints {
            $0.left.bottom.right.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(239)
        }
        
        topView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        topLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(10.5)
        }
        
        storyCountLabel.snp.makeConstraints {
            $0.left.equalTo(topLabel.snp.right).offset(5)
            $0.top.equalToSuperview().inset(17)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(20)
            $0.top.equalTo(topLabel.snp.bottom).offset(3.5)
            $0.right.equalToSuperview().inset(63)
        }
        
        downButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(18)
            $0.top.equalToSuperview().inset(10)
        }
        
        bottomView.snp.makeConstraints {
            $0.left.bottom.right.equalToSuperview()
            $0.top.equalTo(topView.snp.bottom)
        }
        
        storySuperView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(5)
        }
        
        storyTextView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(15)
        }
        
        sendButton.snp.makeConstraints {
            $0.top.equalTo(storySuperView.snp.bottom).offset(5)
            $0.right.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(10)
            $0.height.equalTo(38)
            $0.width.equalTo(102)
        }
        
    }
}

