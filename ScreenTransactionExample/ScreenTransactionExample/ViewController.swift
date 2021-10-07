//
//  ViewController.swift
//  ScreenTransactionExample
//
//  Created by cheonsong on 2021/10/06.
//

import UIKit

class ViewController: UIViewController, SendDataDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController 뷰가 로드 됐다..")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController 뷰가 나타날 것입니다..")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController 뷰가 나타났습니다.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController 뷰가 사라질 것이다.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController 뷰가 사라졌습니다.")
    }

    @IBAction func tapCodePushButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") as? CodePushViewController else { return }
        viewController.name = "Gunter"
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @IBAction func tapCodePresentButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") as? CodePresentViewController
        else { return }
        
        viewController.name = "Gunter"
        viewController.modalPresentationStyle = .fullScreen
        viewController.delegate = self
        self.present(viewController, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SaguePushViewController {
            viewController.name = "Gunter"
        }
    }
    
    func sendData(name: String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
}

