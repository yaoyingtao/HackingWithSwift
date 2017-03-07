//
//  ViewController.swift
//  Project4
//
//  Created by yaoyt on 2017/3/7.
//  Copyright © 2017年 yrhy. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView:WKWebView!;
    var progressView:UIProgressView!;
    var websites = ["apple.com", "hackingwithswift.com"]

    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self;
        view = webView;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped));
        progressView = UIProgressView(progressViewStyle: .default);
        progressView.sizeToFit();
        let progressBar = UIBarButtonItem(customView: progressView);
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil);
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload));
        toolbarItems = [progressBar, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        
        let url = URL(string: "https://" + websites[0])!;
        webView.load(URLRequest(url: url));
        webView.allowsBackForwardNavigationGestures = true;
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }

    func openTapped() {
        let alert = UIAlertController(title: "Open Page..", message: nil, preferredStyle: .actionSheet);
        for web in websites {
            let apple = UIAlertAction(title: web, style: .default, handler: openPage);
            alert.addAction(apple);
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default);
        alert.addAction(cancel);
        present(alert, animated: true)


    }
    
    func openPage(action:UIAlertAction) {
        let url = URL(string:"https://" + action.title!)!;
        webView.load(URLRequest(url: url));
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url;
        
        if let host = url?.host {
            for web in websites {
                if host.range(of: web) != nil {
                    decisionHandler(.allow);
                    return;
                }
            }
        }
        
        decisionHandler(.cancel);
    }
}

