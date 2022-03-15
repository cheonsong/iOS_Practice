//
//  ProfileBoardCell.swift
//  iosRadio
//
//  Created by 인포렉스 on 2022/03/15.
//  Copyright © 2022 inforexIOS2. All rights reserved.
//

import Foundation
import UIKit

class ProfileBoardCell : UITableViewCell {
    
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var cmtNickName: UILabel!
    @IBOutlet weak var cmtTime: UILabel!
    @IBOutlet weak var commentText: UITextView!
    @IBOutlet weak var likeIcon: UIImageView!
    @IBOutlet weak var likeCnt: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var commentIcon: UIImageView!
    @IBOutlet weak var commentCnt: UILabel!
    
    
    @IBAction func tapMore(_ sender: Any) {
    
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
