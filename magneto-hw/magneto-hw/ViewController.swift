//
//  ViewController.swift
//  magneto-hw
//
//  Created by Andrew Clark (RIT Student) on 2/8/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var words =
    [
    " could "," cloud "," bot "," bit "," ask "," a "," geek "," flame "," file "," ed "," ed ",
    " create "," like "," lap "," is "," ing "," I "," her "," drive "," get "," soft "," screen ",
    " protect "," online "," meme "," to "," they "," that "," tech "," space "," source "," y "," write "," while "
    ]
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var fontSize:CGFloat!
    
    
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    @IBAction func importImage(_ sender: Any) {
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
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        switch UIApplication.shared.statusBarOrientation {
            case .portrait:
                fontSize = screenHeight * (0.025)
                break
            case .portraitUpsideDown:
                fontSize = screenHeight * (0.025)
                break
            case .landscapeLeft:
                fontSize = screenWidth * (0.025)
                break
            case .landscapeRight:
                fontSize = screenHeight * (0.025)
                break
            case .unknown:
                fontSize = 20
                break
        }
        fontSize = screenHeight * (0.025)
        
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
        var heightIterator:CGFloat = 0.1
        var x: CGFloat = 10
        for word in words{
            // prob make another function here to reduce the bloat, maybe just one that takes a UILabel and styles it accordingly
            let wordHeight = screenHeight * heightIterator 
            let l = UILabel()
            l.backgroundColor = UIColor(white:1, alpha:0.8)
            l.layer.masksToBounds = true
            l.layer.cornerRadius = 5
            l.layer.borderWidth = 1
            l.layer.borderColor = UIColor.black.cgColor
            l.text = word
            
            l.font = l.font.withSize(fontSize)
            l.sizeToFit()
            let y = wordHeight
            l.frame.origin = CGPoint(x:x,y:y)
            view.addSubview(l)
            l.isUserInteractionEnabled = true
            let panGesture = UIPanGestureRecognizer(target:self, action:#selector(doPanGesture))
            l.addGestureRecognizer(panGesture)
            x = l.frame.width + 10 + x
            if(x > (screenWidth -  l.frame.width - 10)){
                x = 10
                heightIterator = heightIterator + 0.05
                
            }
            print(x)
        }
    }
    
    @objc func doPanGesture(panGesture:UIPanGestureRecognizer){
        let label = panGesture.view as! UILabel
        let position = panGesture.location(in: view)
        label.center = position
    }
    
    // Will be used to reassemble word layout if needed
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape{
            print("LandScape")
        } else {
            print("Portrait")
        }
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

