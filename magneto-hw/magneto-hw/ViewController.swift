//
//  ViewController.swift
//  magneto-hw
//
//  Created by Andrew Clark (RIT Student) on 2/8/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let words =
    [
    "could","cloud","bot","bit","ask","a","geek","flame","file","ed","ed",
    "create","like","lap","is","ing","I","her","drive","get","soft","screen",
    "protect","online","meme","to","they","that","tech","space","source","y","write","while"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        placeWords()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func placeWords(){
        view.backgroundColor = UIColor.orange
        for word in words{
            let l = UILabel()
            l.backgroundColor = UIColor.white
            l.text = word
            l.sizeToFit()
            let x = CGFloat(arc4random() % 280) + 20.0
            let y = CGFloat(arc4random() % 300) + 30.0
            l.center = CGPoint(x:x,y:y)
            view.addSubview(l)
            l.isUserInteractionEnabled = true
            let panGesture = UIPanGestureRecognizer(target:self, action:#selector(doPanGesture))
            l.addGestureRecognizer(panGesture)
        }
    }
    
    @objc func doPanGesture(panGesture:UIPanGestureRecognizer){
        let label = panGesture.view as! UILabel
        let position = panGesture.location(in: view)
        label.center = position
    }

}

