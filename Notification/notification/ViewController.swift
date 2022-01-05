//
//  ViewController.swift
//  sample
//
//  Created by yeoboya_211221_03 on 2022/01/03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func gotoFirst(_ sender: UIStoryboardSegue) {
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "1", message: "2", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "cancel", style: .default)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
