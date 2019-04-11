//
//  UIView+takeSnapshot.swift
//  Counter
//
//  Created by jefferson on 2/20/19.
//  Copyright © 2019 Ima Student. All rights reserved.
//


// credit for takeSnapshot(): http://stackoverflow.com/questions/2214957/how-do-i-take-a-screen-shot-of-a-uiview
import UIKit

extension UIView {
  
    func takeSnapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
