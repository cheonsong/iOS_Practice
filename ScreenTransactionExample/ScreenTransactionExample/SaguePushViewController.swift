//
//  SaguePushViewController.swift
//  ScreenTransactionExample
//
//  Created by cheonsong on 2021/10/06.
//

import UIKit

class SaguePushViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }

    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
