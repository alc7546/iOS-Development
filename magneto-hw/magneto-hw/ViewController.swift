//
//  ViewController.swift
//  magneto-hw
//
//  Created by Andrew Clark (RIT Student) on 2/8/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var words =
    [
    "could","cloud","bot","bit","ask","a","geek","flame","file","ed","ed",
    "create","like","lap","is","ing","I","her","drive","get","soft","screen",
    "protect","online","meme","to","they","that","tech","space","source","y","write","while"
    ]
    var screenWidth : CGFloat!
    var screenHeight : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        screenWidth = UIScreen.main.bounds.width
        screenHeight = UIScreen.main.bounds.height
        placeWords()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func placeWords(){
        view.backgroundColor = UIColor.orange
        print(words.count)
        words.shuffle() //works in Swift 4.2+, uses custom extension for now from stackoverflow
        print(words)
        print(words.count)
        var heightIterator = screenHeight * 0.1
        var temp:CGFloat = 0
        var x: CGFloat = 0
        for word in words{
            let l = UILabel()
            l.backgroundColor = UIColor.white
            l.text = word
            l.sizeToFit()
            x = l.frame.width/2 + 20 + x
            let y = heightIterator
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

//https://stackoverflow.com/questions/24026510/how-do-i-shuffle-an-array-in-swift
extension MutableCollection {
    mutating func shuffle() {
        let c = count
        guard c > 1 else {return}
        
        for(firstUnshuffled, unShuffledCount) in zip(indices,stride(from: c, to: 1, by:-1)){
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unShuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

