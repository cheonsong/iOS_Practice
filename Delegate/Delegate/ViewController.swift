//
//  ViewController.swift
//  Delegate
//
//  Created by yeoboya_211221_03 on 2022/01/04.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var tf: UITextField!
    
    @IBOutlet weak var tf2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tf.placeholder = "값을 입력하세요"
        self.tf.keyboardType = .alphabet
        self.tf.keyboardAppearance = .dark
        self.tf.returnKeyType = .join
        self.tf.enablesReturnKeyAutomatically = true
        self.tf.clearButtonMode = .always
        
        self.tf.layer.borderColor = UIColor.black.cgColor
        self.tf.layer.borderWidth = 2.0
        
        self.tf.delegate = self
    }
    
    // 해당 텍스트 필드의 편집이 시작될 때 자동으로 실행되는 함수
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 시작됩니다")
        return true //false 리턴시 편집되지 않는다.
    }
    
    // 텍스트 필드의 내용이 삭제될 때 호출
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 내용이 삭제")
        return true // false 리턴시 삭제되지 않음
    }
    
    // 텍스트 필드의 내용이 변경될 떄 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("텍스트 필드의 내용이 \(string)으로 변경됩니다.")
        if Int(string) == nil {
            return true
        } else {
            let alert = UIAlertController(title: "알림", message: "숫자 입력 금지", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
    }
    
    // 텍스트 필드의 리턴키가 눌렸을 떄 호출
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tf.resignFirstResponder()
        tf2.becomeFirstResponder()
        print("텍스트 필드의 리턴키가 눌렸습니다")
        return true
    }
}
