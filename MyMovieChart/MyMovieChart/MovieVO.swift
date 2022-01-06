//
//  MovieVO.swift
//  ProtoTypeCell
//
//  Created by yeoboya_211221_03 on 2022/01/05.
//

import Foundation
import UIKit


struct MovieVO {
    var thumbnail: String?  // 영화 섬네일 이미지 주소
    var title: String?  // 영화 제목
    var description: String?    // 영화 설명
    var detail: String? // 상세정보
    var opendate: String?   // 개봉일
    var rating: Double? // 평점
    var thumbnailImage: UIImage?    // 썸네일 이미지
}
