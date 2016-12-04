//
//  ViewController.swift
//  webTest
//
//  Created by dagmara on 24.10.2016.
//  Copyright © 2016 dg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webView.delegate = self
        
        //let url = URL(string: "http://www.google.com")
        //let request = URLRequest(url: url!)
        //webView.loadRequest(request)
        
        // html string
        //let htmlString:String! = "<br /><h1>WebView Test!!!</h1>"
        //webView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        myActivityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivityIndicator.stopAnimating()
    }
    
    @IBAction func playButton(_ sender: AnyObject) {
        let url = URL(string: "http://www.google.com")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
    
    @IBAction func refreshButton(_ sender: AnyObject) {
        webView.reload()
    }
    
    @IBAction func backButton(_ sender: AnyObject) {
        webView.goBack()
    }
    
    @IBAction func forwardButton(_ sender: AnyObject) {
        webView.goForward()
    }
    
    @IBAction func stopButton(_ sender: AnyObject) {
        webView.stopLoading()
        myActivityIndicator.stopAnimating()
    }
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func goToUrl(_ sender: AnyObject) {
        var url = URL(string: textField.text!)
        var request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
    
}

