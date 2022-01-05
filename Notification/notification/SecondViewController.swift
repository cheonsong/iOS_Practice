//
//  SecondViewController.swift
//  notification
//
//  Created by yeoboya_211221_03 on 2022/01/04.
//

import UIKit
import UserNotifications

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func save(_ sender: UIButton) {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                    // 알람 설정
                    DispatchQueue.main.async {
                        // 알람 콘텐츠 정의
                        let nContent = UNMutableNotificationContent()
                        nContent.body = (self.textField.text)!
                        nContent.title = "미리 알림"
                        nContent.sound = UNNotificationSound.default
                        
                        // 발송 시각을 '지금으로부터 ~초 형식'으로 변환
                        let time = self.datePicker.date.timeIntervalSinceNow
                        // 발송 조건 정의
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                        // 발송 요청 객체 정의
                        let request = UNNotificationRequest(identifier: "alarm", content: nContent, trigger: trigger)
                        // 노티피케이션 센터에 추가
                        UNUserNotificationCenter.current().add(request) { _ in
                            DispatchQueue.main.async {
                                // 발송 완료 안내 메세지 창
                                let date = self.datePicker.date.addingTimeInterval(9*60*60)
                                let message = "알림이 등록되었습니다. 등록된 알람은 \(date)에 발송됩니다."
                                
                                let alert = UIAlertController(title: "알림 등록", message: message, preferredStyle: .alert)
                                
                                let ok = UIAlertAction(title: "확인", style: .default)
                                alert.addAction(ok)
                                
                                self.present(alert, animated: false)
                            }
                        }
                    }
                }
                else {
                    //알림이 허용되지 않은 경우
                    let alert = UIAlertController(title: "알림 등록", message: "알림이 허용되어 있지 않습니다.", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(ok)
                    
                    self.present(alert, animated: true)
                    return
                }
            }
        } else {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.borderStyle = .bezel
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
