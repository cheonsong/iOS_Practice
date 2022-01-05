//
//  SceneDelegate.swift
//  sample
//
//  Created by yeoboya_211221_03 on 2022/01/03.
//

import UIKit
import UserNotifications

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                    //알림 기본속성
                    let nContent = UNMutableNotificationContent()
                    nContent.badge = 1
                    nContent.title = "로컬 알림 메세지"
                    nContent.subtitle = "~~"
                    nContent.body = "들어오세요:"
                    nContent.sound = UNNotificationSound.default
                    nContent.userInfo = ["name": "홍길동"]
                    
                    //알림 발송 조건 객체
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    
                    //알림 요청 객체
                    let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
                    
                    //notification 추가
                    UNUserNotificationCenter.current().add(request)
                } else {
                    print("사용자 동의 ㄴㄴ")
                }
            }
        }
        else {
            let application = UIApplication.shared
            // 알림 설정 확인
            let setting = application.currentUserNotificationSettings
            
            // 알림 설정이 되어 있지 않다면 로컬 알림을 보내도 받을 수 없으므로 종료함
            guard setting?.types != .none else {
                print("동의 ㄴㄴ")
                return
            }
            
            //로컬 알림 인스턴스 생성
            let noti = UILocalNotification()
            noti.fireDate = Date(timeIntervalSinceNow: 10)  // 10초 후 발송
            noti.timeZone = TimeZone.autoupdatingCurrent    // 현재 위치에 따라 타임존 설정
            noti.alertBody = "얼른 다시 접속하세요"  // 표시될 메세지
            noti.alertAction = "학습하기"   // 잠금상태일 때 표시될 액션
            noti.applicationIconBadgeNumber = 1 // 배지
            noti.soundName = UILocalNotificationDefaultSoundName    // 로컬 알람 도착시 사운드
            noti.userInfo = ["name": "홍길동"] // 알람 실행시 함께 전달하고 싶은 값.
            
            //생성된 알람 객체를 스케줄러에 등록
            application.scheduleLocalNotification(noti)
        }
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

