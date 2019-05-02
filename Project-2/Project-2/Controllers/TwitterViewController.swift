//
//  TwitterViewController.swift
//  Project-2
//
//  Created by Andrew Clark (RIT Student) on 5/2/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit
import WebKit

// Embed Twitter View
class TwitterViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    var webContent = """
                    <a class="twitter-timeline" data-theme="dark" href="https://twitter.com/MortalKombat?ref_src=twsrc%5Etfw">Tweets by MortalKombat</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                    """

    
    // Load in Twitter Stream
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadHTMLString(webContent, baseURL: nil)
        self.view.backgroundColor = UIColor(red:41/255, green:47/255, blue:50/255, alpha:1.0)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
