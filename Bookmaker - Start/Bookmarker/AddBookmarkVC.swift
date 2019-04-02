//
//  AddBookmarkVC.swift
//  Bookmarker
//
//  Created by Student on 4/2/19.
//  Copyright © 2019 tony. All rights reserved.
//

import UIKit

class AddBookmarkVC: UIViewController {

    var bookmark:Bookmark?
    @IBOutlet weak var titleField:UITextField!
    @IBOutlet weak var urlField:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Bookmark"
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let name = (titleField.text?.count)! > 0 ? titleField.text! : "No title entered"
        let url = (urlField.text?.count)! > 0 ? titleField.text!: "No URL entered"
        
        bookmark = Bookmark(name: name, url: url)
    }
    

}
