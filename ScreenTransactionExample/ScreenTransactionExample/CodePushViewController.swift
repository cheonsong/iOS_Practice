//
//  CodePushViewController.swift
//  ScreenTransactionExample
//
//  Created by cheonsong on 2021/10/06.
//

import UIKit

class CodePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
