//
//  DallaFloatingView2.swift
//  iosRadio
//
//  Created by cheonsong on 2022/04/01.
//  Copyright © 2022 inforexIOS2. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import Then
import RxCocoa
/**
 Floating View 인스턴스 생성하고 꼭 configUI 실행해 주세요!
 */

class DallaFloatingView: UIView {
    
    enum FloatingType: String {
        case live = "Live"
        case clip = "Clip"
    }
    
    let bag = DisposeBag()
    var type: FloatingType = .live
    
    var backgroundImage = UIImageView().then {
        $0.image = UIImage(named: "tc01190000239")
        $0.contentMode = .scaleToFill
    }
    
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    var typeIcon = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    var profileImage = UIImageView().then {
        $0.image = UIImage(named: "tc01190000239")
        $0.contentMode       = .scaleAspectFill
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.white.cgColor
    }
    
    var titleLabel = UILabel().then {
        $0.text  = "라이브 방송 중입니다!"
    }
    
    var djLabel = UILabel().then {
        $0.text = "플레이어 만든사람"
        
    }
    
    var playButton = UIButton().then {
        $0.setImage(UIImage(named: "btnPlayerPlay"), for: .normal)
    }
    
    var cancelButton = UIButton().then {
        $0.setImage(UIImage(named: "btnPlayerCancel"), for: .normal)
    }
    
//    var cancelButton = UIImageView().then {
//        $0.image = UIImage(named: "btnPlayerCancel")
//        $0.isUserInteractionEnabled = true
//    }
    
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
        setConstraint()
        UIEvent()
    }
    
    func setUI() {
        addSubview(backgroundImage)
        backgroundImage.addSubview(effectView)
        backgroundImage.addSubview(typeIcon)
        backgroundImage.addSubview(profileImage)
        backgroundImage.addSubview(titleLabel)
        backgroundImage.addSubview(djLabel)
        backgroundImage.addSubview(playButton)
        backgroundImage.addSubview(cancelButton)
    }
    
    func setConstraint() {
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        effectView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        typeIcon.snp.makeConstraints{
            $0.left.equalTo(12)
            $0.width.equalTo(22)
            $0.height.equalTo(27)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17)
            $0.left.equalTo(profileImage.snp.right).offset(12)
            $0.right.equalTo(playButton.snp.left).offset(-12)
        }
        
        djLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.left.equalTo(profileImage.snp.right).offset(12)
            $0.right.equalTo(playButton.snp.left).offset(-12)
        }
        
        profileImage.snp.makeConstraints{
            $0.width.height.equalTo(55)
            $0.left.equalTo(typeIcon.snp.right).offset(8)
            $0.centerY.equalToSuperview()
        }
        
        playButton.snp.makeConstraints{
            $0.width.height.equalTo(28)
            $0.centerY.equalToSuperview()
        }
        
        cancelButton.snp.makeConstraints{
            $0.width.height.equalTo(28)
            $0.left.equalTo(playButton.snp.right).offset(12)
            $0.right.equalToSuperview().offset(-20)
            $0.centerY.equalToSuperview()
        }
    }
    
    func UIEvent() {
                cancelButton.rx.tap
                    .subscribe (onNext: {
                        print("태래래래래래ㅐ래래래래랩")
                        self.removeFromSuperview()
                    })
                    .disposed(by: bag)
    }
    
    //    // MARK: @ 플루팅 모드 세팅
    //    func configUI(roomInfoData : RoomInfoDataModel){
    //
    //        if roomInfoData.mediaType == "a" {
    //            typeIcon.image = UIImage(named: "gifLive")
    //            playButton.isHidden = true
    //        } else {
    //            typeIcon.image = UIImage(named: "gifClip")
    //            playButton.isHidden = false
    //        }
    //
    //        backgroundImage.sd_setImage(with: URL(string: roomInfoData.bjProfImg?.url ?? ""), completed: nil)
    //
    //        profileImage.sd_setImage(with: URL(string: roomInfoData.bjProfImg?.url ?? ""), completed: nil)
    //
    //        titleLabel.text = roomInfoData.title
    //
    //        djLabel.text = roomInfoData.bjNickNm
    //
    //    }
    
    //    deinit {
    //        Log.d("Audio Floating View Deinit")
    //    }
    
}
