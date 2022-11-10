//
//  WebViewController.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 10/11/22.
//

import UIKit
import WebKit
import SafariServices

enum UrlCase {
    case urlMoka
    case urlAuthorize
    case urlClient
}

class WebViewController: UIViewController {
    
    private var urlCase = UrlCase.urlMoka
    private var url : String = "https://backoffice.mokapos.com/apps/2000000285/learn-more"
    private var urlClient = ""
    var webView: WKWebView!
//    lazy var webView: WKWebView = {
//
//        return web
//    }()
    
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
//        config.userContentController
        config.defaultWebpagePreferences = wkPref
        
        webView = WKWebView(frame: view.bounds, configuration: config)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        webView.uiDelegate = self

    }
//
//    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
//        print("done")
//        showTutorial()
//    }
//
//    func safariViewController(_ controller: SFSafariViewController, initialLoadDidRedirectTo URL: URL) {
//        print("url: \(URL.absoluteString)")
//        urlClient = URL.absoluteString
//    }
//
//    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
//        print("finish load")
////        print(controller)
//    }
    
//    func showTutorial() {
//
//        switch urlCase {
//        case .urlMoka:
//            url = "https://backoffice.mokapos.com/apps/2000000285/learn-more"
//            urlCase = UrlCase.urlClient
//        case .urlClient:
//            url = urlClient
//            urlCase = UrlCase.urlAuthorize
//        case .urlAuthorize:
//            url = urlClient
//        }
//        loadData()
//    }
//
//    func loadData() {
//        if let url = URL(string: url) {
//            let config = SFSafariViewController.Configuration()
//            config.entersReaderIfAvailable = true
//
//            let vc = SFSafariViewController(url: url, configuration: config)
//            vc.delegate = self
//            present(vc, animated: true)
//        }
//    }
    
    /*
     override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
     if keyPath == "title" {
     if let title = self.webView.title {
     print(title)
     }
     }
     
     for page in webView.backForwardList.backList {
     print("User visited \(page.url.absoluteString)")
     }
     
     }
     
    
    
     */
    
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
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let requestURL = navigationAction.request.url, requestURL.pathComponents.contains("code") {
            //Do your things
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
        
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        if let currentURL = webView.url{
            if self.url == currentURL.absoluteString{
                print(self.url)
            }
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let currentURL = webView.url {
            print(currentURL)
        }
    }
    
}
