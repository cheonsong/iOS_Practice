//
//  ViewController.swift
//  AlamofireTest
//
//  Created by yeoboya_211221_03 on 2022/01/06.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    struct Product: Codable {
        var name: String
        var points: Int
    }
    
    let json = """
    {
        "name": "Durian",
        "points": 600,
    },
    {
        "name": "ASurian",
        "points": 500,
    }
    """.data(using: .utf8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let decoder = JSONDecoder()
        let product = try? decoder.decode(Product.self, from: json!)
        
        print(product)
    }
    
    func getTest() {
        
    }


}

/*
*/
