//
//  ViewController.swift
//  WKWebViewPractice
//
//  Created by Ankur Baranwal on 22/11/2019.
//  Copyright © 2019 Ankur Baranwal. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    var webView: WKWebView?
    @IBOutlet weak var webViewView: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        webView?.uiDelegate = self
        webView?.navigationDelegate = self
        self.view.addSubview(webView!)
        let myURL = URL(string:"https://www.google.com")
        let myRequest = URLRequest(url: myURL!)
        webView?.load(myRequest)
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func viewWillLayoutSubviews() {
         webView?.frame = self.webViewView.frame
    }
    //1
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("1")
    }
    //4
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("2")
    }
    //2
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("3")
    }
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        print("4")
//    }
    //3
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction:WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) ->Void) {
        
        var urlString:NSString! = navigationAction.request.url?.absoluteString as NSString?
        print(urlString)
        if urlString == "https://www.google.com/" {
            decisionHandler(WKNavigationActionPolicy.allow)
        } else {
            decisionHandler(WKNavigationActionPolicy.cancel)
        }
        //Be sure to add this code or it will be abnormal
    }

    func webView(_ webView: WKWebView, shouldPreviewElement elementInfo: WKPreviewElementInfo) -> Bool {
        print(elementInfo.linkURL)
        return true
    }
    
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("\(navigation) \(error)")
    }
    
    
}


