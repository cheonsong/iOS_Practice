//
//  ImageViewController.swift
//  Delegate
//
//  Created by yeoboya_211221_03 on 2022/01/05.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func imagePickButton(_ sender: UIButton) {
        let picker = UIImagePickerController()  // 이미지 피커 컨트롤러 인스턴스 생성
        picker.sourceType = .photoLibrary   // 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true // 이미지 편집 가능
        picker.delegate = self
        
        // 이미지 피커 컨트롤러 실행
        self.present(picker, animated: false)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

// MARK: ImagePickerControllerDelegate Method
extension ImageViewController: UIImagePickerControllerDelegate {
    // 이미지 피커에서 이미지를 선택했을 때 호출되는 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: false) { () in
            //이미지를 이미지 뷰에 표시
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imageView.image = img
        }
    }
    
    // 이미지 피커에서 이미지를 선택하지 않고 취소했을 때 메서드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // completion핸들러로 처리하는 이유 : picker가 화면에서 사라지기 전에 알림창이 실행될 경우 알림창이 정상적으로 나타나지 않을 수 있음 이를 방지하기 위해 dismiss 구문이 실행된 후 알림창이 생성되도록 하기 위해
        picker.dismiss(animated: false) { () in
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: false, completion: nil)
        }
    }
}

// MARK: NavagationControllerDelegate Method
extension ImageViewController: UINavigationControllerDelegate {
    
}
