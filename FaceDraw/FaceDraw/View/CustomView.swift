//
//  CustomView.swift
//  FaceDraw
//
//  Created by Andrew Clark (RIT Student) on 4/8/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit


@IBDesignable class CustomView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        // Get a reference to the drawing space of the current view
        let ctx = UIGraphicsGetCurrentContext()!
        
        // Set the current fill color for drawing.
        // The fill is the area inside of a mathematical path
        ctx.setFillColor(UIColor.red.cgColor)
        
        // Set the current stroke color for drawing
        // Stroke follows an outline of a mathematical path
        ctx.setStrokeColor(UIColor.purple.cgColor)
        
        // Set the current stroke width
        ctx.setLineWidth(8.0)
        
        // #1 - Fill entire background
        ctx.fill(bounds)
        
        // #2 - Fill and stroke
        let myRectangle = CGRect(x:84, y:800, width:600, height:260)
        
        // Change fill color
        ctx.setFillColor(UIColor.yellow.cgColor)
        
        // Fill just rectangle
        ctx.fill(myRectangle)
        
        // Draw aroundside
        ctx.stroke(myRectangle)
        
        // Draw nose in middle of screen rotated 180deg
        drawRectangle(ctx: ctx, x: 768/2, y: 1024/2, width: 50, height: 100, scaleX: 1.5, scaleY: 1.5, rotation: .pi/10)
        
        // Draw Eyebrows
        // Left
        ctx.saveGState()
        ctx.translateBy(x: 195, y: 70)
        ctx.rotate(by: .pi / -3.0)
        
        for i in 0..<5{
            drawRectangle(ctx: ctx, x: 0, y: CGFloat(i) * 30, width: 50, height: 10, scaleX: 1, scaleY: 1, rotation: .pi / -8.0)
        }
        ctx.restoreGState()
        
        // Right
        ctx.saveGState()
        ctx.translateBy(x: 550, y: 70)
        ctx.rotate(by: .pi/3.0)
        
        for i in 0..<5{
            drawRectangle(ctx: ctx, x: 0, y: CGFloat(i) * 30, width: 50, height: 10, scaleX: 1, scaleY: 1, rotation: .pi/8)
        }
        ctx.restoreGState()
        
        
        // #4 Create four ellipses for eyes/pupils
//        let myLeftEye = CGRect(x:150, y:165, width:145, height:95)
//        ctx.fillEllipse(in: myLeftEye)
//        ctx.strokeEllipse(in: myLeftEye)
        drawEllipse(ctx: ctx, x: 150, y: 165, width: 145, height: 95, scaleX: 1, scaleY: 1, rotation: 0)
        drawEllipse(ctx: ctx, x: 453, y: 165, width: 145, height: 95, scaleX: 1, scaleY: 1, rotation: 0)
        
        // Set fill for pupils
        UIColor.blue.setFill()
        
        // Draw pupils
        drawEllipse(ctx: ctx, x: 240, y: 188, width: 40, height: 40, scaleX: 1, scaleY: 1, rotation: 0)
        drawEllipse(ctx: ctx, x: 468, y: 188, width: 40, height: 40, scaleX: 1, scaleY: 1, rotation: 0)
      
        
        // #5 - Draw teeth (paths)
        ctx.setFillColor(red:0.0, green:1.0, blue:0.2, alpha:1.0)
        ctx.setStrokeColor(UIColor.brown.cgColor)
        ctx.setLineWidth(4.0)
        
        // Left tooth
        // Push drawing state
        ctx.saveGState()
        // translate drawing down to the right side of the mouth
        ctx.translateBy(x: 150.0, y: 805.0)
        
        // Points are counter-clockwise
        ctx.beginPath()
        ctx.move(to: CGPoint(x:70,y:0))
        ctx.addLine(to: CGPoint(x:0,y:0))
        ctx.addLine(to: CGPoint(x:35,y:80))
        ctx.closePath()
        ctx.drawPath(using: .fillStroke)
        
        // pop state back to (0,0)
        ctx.restoreGState()
        
        // right tooth
        // push drawing state
        ctx.saveGState()
        // translate to right side side of mouth
        ctx.translateBy(x: 550.0, y: 805.0)
        
        // Counter-clockwise points
        ctx.beginPath()
        ctx.move(to: CGPoint(x:70,y:0))
        ctx.addLine(to: CGPoint(x:0,y:0))
        ctx.addLine(to: CGPoint(x:35,y:80))
        ctx.closePath()
        ctx.drawPath(using: .fillStroke)
        
        // pop state back
        ctx.restoreGState()
    }
    
    func drawRectangle(ctx:CGContext, x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, scaleX: CGFloat, scaleY: CGFloat, rotation:CGFloat){
        ctx.saveGState()
        ctx.translateBy(x: x, y: y)
        ctx.scaleBy(x: scaleX, y: scaleY)
        ctx.rotate(by: rotation)
        let rect = CGRect(x:-width/2, y:-height/2, width:width, height:height)
        ctx.fill(rect)
        ctx.stroke(rect)
        ctx.restoreGState()
    }
    
    func drawEllipse(ctx:CGContext, x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, scaleX:CGFloat, scaleY:CGFloat, rotation:CGFloat){
        ctx.saveGState()
        ctx.scaleBy(x: scaleX, y: scaleY)
        ctx.rotate(by: rotation)
        let ellipse = CGRect(x:x,y:y, width:width, height:height)
        ctx.fillEllipse(in: ellipse)
        ctx.strokeEllipse(in: ellipse)
        ctx.restoreGState()
    }
    

}
