//
//  ViewController.swift
//  magneto-hw
//
//  Created by Andrew Clark (RIT Student) on 2/8/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    //MARK: Variables
    var defaultWords = WordSets.pirateWords
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var fontSize:CGFloat!
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    var heightIterator:CGFloat = 0.1
    var x: CGFloat = 10
    @IBOutlet weak var backgroundImport: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        fontSize = screenHeight * (0.025)
        placeWords(set: defaultWords)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    // Place the labels around the screen
    func placeWords( set: [String]){
        var set = set
        
        //FIXME: Change tags to an enum value
        // Deletes all previous items within the view that have the tag: 100
        deleteWithTags(tag: 100)
        
        //FIXME: Background Color
        view.backgroundColor = UIColor.orange
        
        //FIXME: Change Shuffle to 4.2 method
        set.shuffle() //works in Swift 4.2+, uses custom extension for now from stackoverflow
        
        // Iterators for placement
        heightIterator = 0.1
        x = 10
        
        // For each word in givent set of words, make labels out of them
        // Gives them style, text, position, interaction to each
        for word in set{
          makeLabels(word: word)
        }
    }
    
    
    //MARK: Gesture - Dragging Objects
    @objc func doPanGesture(panGesture:UIPanGestureRecognizer){
        let label = panGesture.view as! UILabel
        let position = panGesture.location(in: view)
        label.center = position
        
        // MARK: Animation in Progress
        if panGesture.state == UIGestureRecognizerState.ended{
            // Get velocity and others
            let velocity = panGesture.velocity(in: self.view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            print(magnitude)
            let slideMultiplier = magnitude / 200
            
            // 2
            let slideFactor = 0.1 * slideMultiplier
            
            //3
            let finalPoint = CGPoint(x:panGesture.view!.center.x + (velocity.x * slideFactor), y:panGesture.view!.center.y + (velocity.y * slideFactor))
            
            
            
            //5
            if(magnitude > 800 && ((finalPoint.x <= -50) || (finalPoint.x > self.view.bounds.width + 100) || (finalPoint.y <= -50) || (finalPoint.y > self.view.bounds.height + 50)))
            {
                
                
                UIView.animate(withDuration: 2.5,
                               delay: 0,
                               options: UIViewAnimationOptions.curveEaseOut,
                               animations: {
                                panGesture.view!.center = finalPoint
                                self.view.shake()
                                },
                               completion: {_ in
                                label.removeFromSuperview() // delete from view
                            })
                
            }
        }
    }

   
    //MARK: Action - Segue -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "showWordSegue"{
            let wordsVC = segue.destination.childViewControllers[0] as! WordSetVC 
            wordsVC.title = "Choose a word set!"
        }
    }
    
    // Done Button
    @IBAction func unwindToMain(segue:UIStoryboardSegue){
        if segue.identifier == "DoneTapped"{
            let wordVC = segue.source as! WordSetVC
            let wordSet = wordVC.selectedSet
            placeWords(set: wordSet)
            print("Done Tapped")
        }
    }

    
    
    //MARK: Background Importer
    @IBAction func importBackground(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        image.allowsEditing = false
        self.present(image, animated: true, completion: {})
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            backgroundImage.image = image
            backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
            self.view.insertSubview(backgroundImage, at: 0)
        } else {
            print("Error in importing image")
        }
        self.dismiss(animated: true, completion: {})
    }
    
    
    // MARK: Helper Functions
    func deleteWithTags(tag: Int){
        for view in self.view.subviews{
            if view.tag == 100{
                view.removeFromSuperview()
            }
        }
    }
    
    // Style, position, enable each label
    func makeLabels(word: String){
        // Style
        let label = UILabel()
        label.tag = 100 // change w/ enum
        label.backgroundColor = UIColor(white:1,alpha:0.8)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.text = " \(word) "
        label.font = label.font.withSize(fontSize)
        label.sizeToFit()
        
        // Position
        let y = screenHeight * heightIterator // y position, based on screenheight and custom var
        let position = CGPoint(x:x, y:y)
        label.frame.origin = position
        view.addSubview(label)
        
        x = label.frame.width + 10 + x
        // Check if the words need to be placed on new row
        if(x > (screenWidth - label.frame.width - 12)){
            x = 10 // reset x position
            heightIterator = heightIterator + 0.05 // increase custom var
        }
        
        // Enable Interaction
        label.isUserInteractionEnabled = true
        let panGesture = UIPanGestureRecognizer(target: self, action:#selector(doPanGesture))
        label.addGestureRecognizer(panGesture)
    }
    
    func deleteLabel(label: UILabel){
        print(label.tag)
    }
    
    // MARK: Animations
    
    
    
}

// TODO: Delete the words once flung off the screen in animate's completion method



