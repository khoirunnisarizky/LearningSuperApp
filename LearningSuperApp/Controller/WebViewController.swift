//
//  WebViewController.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 10/11/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    private var url : String = "https://backoffice.mokapos.com/apps/2000000285/learn-more"
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        webConfiguration()

        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        webView.load(url)
    }
    
    func webConfiguration() {
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences.allowsContentJavaScript = true
        
        let wkPref = WKWebpagePreferences()
        wkPref.allowsContentJavaScript = true
        
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true
        
        config.preferences = preferences
        config.defaultWebpagePreferences = wkPref
        
        webView = WKWebView(frame: view.bounds, configuration: config)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        webView.uiDelegate = self

    }
    
}

extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}

extension WebViewController: WKNavigationDelegate, WKUIDelegate {

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        
        return nil
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let currentURL = webView.url {
            print(currentURL)
        }
    }
    
}
