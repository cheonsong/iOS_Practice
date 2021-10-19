//
//  RoundButton.swift
//  Calculator
//
//  Created by cheonsong on 2021/10/19.
//

import UIKit

class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = true {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
