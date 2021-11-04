//
//  DiaryCell.swift
//  Diary
//
//  Created by cheonsong on 2021/10/26.
//

import UIKit

class DiaryCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    //UIView가 storyboard에서 생성될때 이 생성자를 통해 객체가 생성됨
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.contentView.layer.cornerRadius = 3.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.black.cgColor
    }
}
