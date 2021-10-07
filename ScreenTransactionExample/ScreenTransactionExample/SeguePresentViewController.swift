//
//  SeguePresentViewController.swift
//  ScreenTransactionExample
//
//  Created by cheonsong on 2021/10/06.
//

import UIKit

class SeguePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
