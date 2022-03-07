//
//  ViewController.swift
//  SystemVolumeControl
//
//  Created by cheonsong on 2022/02/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var volume: Float = 0.0
    var audioSession: AVAudioSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setActive(true, options: [])
            audioSession.addObserver(self, forKeyPath: "outputVolume", options: .new, context: nil)
            volume = audioSession.outputVolume
        } catch {
            print("error")
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "outputVolume" {
            let volume = AVAudioSession.sharedInstance().outputVolume
            print(volume)
        }
    }
    
//    deinit {
//        audioSession.removeObserver(self, forKeyPath: "outputVolume")
//    }
}

