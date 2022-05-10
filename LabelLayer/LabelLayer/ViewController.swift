//
//  ViewController.swift
//  LabelLayer
//
//  Created by cheonsong on 2022/05/10.
//

import UIKit

class ViewController: UIViewController {

    lazy var sview: UIView = {
       var view = UIView()
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 0, y: 200))
        path.addLine(to: CGPoint(x: 180, y: 200))
        path.addLine(to: CGPoint(x: 180, y: 180))
        path.addLine(to: CGPoint(x: 200, y: 180))
        path.addLine(to: CGPoint(x: 200, y: 0))
        path.close()
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.clear.cgColor
        layer.fillColor = UIColor.blue.cgColor
        
        view.layer.addSublayer(layer)
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(sview)
        
        
        
        
    }


}

