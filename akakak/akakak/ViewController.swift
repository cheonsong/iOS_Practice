//
//  ViewController.swift
//  akakak
//
//  Created by cheonsong on 2022/04/01.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var customView: DallaFloatingView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView = DallaFloatingView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 72))
        view.addSubview(customView!)
        customView?.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(72)
        }
        // Do any additional setup after loading the view.
    }


}

