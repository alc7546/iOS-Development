//
//  DetailsViewController.swift
//  Project-2
//
//  Created by Andrew Clark (RIT Student) on 4/15/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var myTitle:UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var bio: UILabel!
    
    
    
    /*
     
     */
    var titleText: String = ""
    var bioText: String = ""
    var image: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTitle.text = titleText
        mainImage.image = image
        bio.text = bioText
        bio.numberOfLines = 0;
        bio.sizeToFit()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "CharacterBackground"))
        self.bio.layer.addBorder(edge: UIRectEdge.top, color: UIColor(red: 198/255, green: 175/255, blue:103/266, alpha:1.0), thickness: 0.5)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
