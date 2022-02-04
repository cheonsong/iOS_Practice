//
//  ViewController.swift
//  RxSwiftProject
//
//  Created by cheonsong on 2022/02/04.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tf: UITextField!
    @IBOutlet weak var la: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToViewModel()
        // Do any additional setup after loading the view.
    }
    
    func bindToViewModel() {
        //Input
        let input = ViewModel.Input(text: tf.rx.text.orEmpty.asObservable(),
                                    tap: button.rx.tap.asObservable())
        
        let output = viewModel.transform(input: input)
        
        // Output
        output.label
            .bind(to: la.rx.text)
            .disposed(by: disposeBag)
        
    }

}

