//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by yeoboya_211221_03 on 2022/01/07.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var link: String?
    var link2: String?
    
    @IBOutlet weak var wk: WKWebView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wk.navigationDelegate = self
        
        guard let link = link else {
            print("link empty")
            return
        }
        
        // 웹뷰에 웹 띄우기
        let request = URLRequest(url: URL(string: link)!)
        self.wk.load(request)
    }
}

// MARK: - WKNavigationDelegate
extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.spinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.spinner.stopAnimating()
    }
}
