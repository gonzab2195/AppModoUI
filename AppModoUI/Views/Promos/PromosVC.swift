//
//  ViewController.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 29/01/2024.
//

import UIKit
import WebKit

class PromosVC: ViewManager, WKNavigationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        Navigation.hideNavigationBar(view: self)
        
        
        let webView = WKWebView()
        webView.navigationDelegate = self
       
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webView)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
       
        
        let url = URL(string: "https://modo.com.ar/promos-app")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
       
    }

}
