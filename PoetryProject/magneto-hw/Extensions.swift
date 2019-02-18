//
//  Extensions.swift
//  magneto-hw
//
//  Created by Andrew Clark (RIT Student) on 2/17/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

//MARK: Animations for UIView
extension UIView{
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 1.0
        animation.values = [-1.0,1.0,-1.0,1.0,-0.5,0.5,-0.25,0.25,0.0, 0.0]
        layer.add(animation, forKey: "shake")
    }
    
    func fadeIn(withDuration duration: TimeInterval = 1.0){
        UIView.animate(withDuration: duration, animations: {
            self.backgroundColor = UIColor(white:1, alpha:0.8)
            
        })
    }
    
    func fadeOut(withDuration duration: TimeInterval = 1.0){
        UIView.animate(withDuration:duration, animations: {
            self.alpha = 0.0
            
        })
    }
}

//https://stackoverflow.com/questions/24026510/how-do-i-shuffle-an-array-in-swift
// literally done with .shuffle in Swift 4.2+
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
