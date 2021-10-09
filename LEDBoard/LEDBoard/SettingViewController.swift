//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by cheonsong on 2021/10/09.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var yelloButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tapTextColorButton(_ sender: UIButton) {
        if sender == self.yelloButton {
            self.changeTextColor(color: .yellow)
        } else if sender == self.blueButton {
            self.changeTextColor(color: .blue)
        } else {
            self.changeTextColor(color: .green)
        }
    }
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        if sender == self.blackButton {
            self.changeBackgroundColor(color: .black)
        } else if sender == self.purpleButton {
            self.changeBackgroundColor(color: .purple)
        } else {
            self.changeBackgroundColor(color: .orange)
        }
    }
    @IBAction func tapSaveButton(_ sender: UIButton) {
        
    }
    
    private func changeTextColor(color: UIColor) {
        self.yelloButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
    }
    
    private func changeBackgroundColor(color: UIColor) {
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
