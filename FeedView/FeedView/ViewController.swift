//
//  ViewController.swift
//  FeedView
//
//  Created by cheonsong on 2022/03/15.
//

import UIKit

class ViewController: UIViewController {

    var board: ProfileBoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        board = ProfileBoardView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.addSubview(board)
        board.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
    }


    
}

