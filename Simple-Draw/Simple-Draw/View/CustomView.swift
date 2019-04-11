//
//  CustomView.swift
//  Simple-Draw
//
//  Created by Andrew Clark (RIT Student) on 4/10/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class CustomView: UIView {
    var layers = NSMutableArray()
    var layerIndex = -1
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // get the touch
        if let touch = touches.first{
            layerIndex = layerIndex + 1
            // get the CGPoint in the touch
            let pt = touch.location(in: self)
            // create a new array of points, essentially a layer
            // that we will continue to add points to until the user
            // lifts their finger
            let points = NSMutableArray()
            // add the current point to the "layer"
            points.add(pt)
            layers.add(points)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // get touch and CGPoint location
        let touch : UITouch! = touches.first
        let pt = touch.location(in: self)
        // grab the array "layer" we made back in touchesBegan()
        let points = layers[layerIndex] as! NSMutableArray
        // add point to it
        points.add(pt)
        // tell the system to update view
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        setNeedsDisplay()
        let points = layers[layerIndex] as! NSMutableArray
        print("Done - layer=\(layerIndex) points=\(points)")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesEnded(touches, with: event!)
    }
    
    override func draw( _ rect: CGRect){
        guard layers.count > 0 else{
            return
        }
        // Drawing Code
        // Get pointer to view
        if let ctx = UIGraphicsGetCurrentContext(){
            // Loop through possible layers
            for points in layers{
                // Pen color is black
                ctx.setStrokeColor(red:0, green:0, blue:0, alpha:1)
                // line width to 3
                ctx.setLineWidth(3)
                // set more values
                ctx.setLineJoin(.round)
                ctx.setLineCap(.round)
                
                // loop through each layer's point values
                let points = points as! NSMutableArray
                guard points.count >= 2 else{
                    continue
                }
                
                let startPoint = points[0] as! CGPoint
                ctx.move(to: startPoint)
                for i in (1..<points.count-1){
                    let point = points[i] as! CGPoint
                    ctx.addLine(to: point)
                } // end inner
                
                ctx.strokePath()
            } // end outer
        } // end if let
    } // end draw
    
   // MARK - Methods -
    func cls(){
        layerIndex = -1
        layers.removeAllObjects()
        setNeedsDisplay()
    }
    
    func undo(){
        if layers.count > 0{
            layers.removeLastObject()
            layerIndex -= 1
            setNeedsDisplay()
        }
    }

}
