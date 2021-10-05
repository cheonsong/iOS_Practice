//
//  ViewController.swift
//  QuotesGenerator
//
//  Created by cheonsong on 2021/10/05.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    let quotes: [Quote] = [
        Quote(content: "집에 가고 싶어", name: "나"),
        Quote(content: "개발자는 은퇴하는 그 날까지 공부한다.", name: "나1"),
        Quote(content: "1일 1커밋하자", name: "나2"),
        Quote(content: "하루에 더도말고 네시간씩만 해보자", name: "나3"),
        Quote(content: "꾸준히 페이스를 유지하며 성장하자", name: "나4")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapQuoateGeneratorButton(_ sender: Any) {
        let random = Int(arc4random_uniform(5)) //0~4사이의 난수
        let quote = quotes[random]
        self.quoteLabel.text = quote.content
        self.nameLabel.text = quote.name
    }
    
}

