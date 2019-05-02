//
//  TwitterViewController.swift
//  Project-2
//
//  Created by Andrew Clark (RIT Student) on 5/2/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit
import WebKit

class TwitterViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    var webContent = """
                    <a class="twitter-timeline" data-theme="dark" href="https://twitter.com/MortalKombat?ref_src=twsrc%5Etfw">Tweets by MortalKombat</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                    """

    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadHTMLString(webContent, baseURL: nil)
    }
    
}
