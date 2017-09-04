//
//  ViewController.swift
//  American Electric Power Check In / Check Out
//
//  Created by Matt Kimberlain on 9/3/17.
//  Copyright © 2017 Matt Kimberlain. All rights reserved.
//

import UIKit
import WebKit
import CoreLocation


class ViewController: UIViewController,WKNavigationDelegate, CLLocationManagerDelegate {
    var webView: WKWebView!
    var manager: CLLocationManager!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        let url = URL(string: "https://cico.aep.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

