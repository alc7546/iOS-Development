//
//  ViewController.swift
//  Project-2
//
//  Created by Andrew Clark (RIT Student) on 4/15/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

import UIKit
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var roster = Roster.shared
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedCell: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:(#imageLiteral(resourceName: "CharacterBackground")))
        collectionView.backgroundColor = UIColor.clear
        print(roster.characters.count)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.tintColor = UIColor(red: 198/255, green: 175/255, blue:103/266, alpha:1.0)
    }
    // MARK: - UICollectionViewDataSource protocol
    
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.roster.characters.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        print(roster.characters)
        cell.backgroundColor = UIColor(patternImage: roster.characters[indexPath.row].rosterIcon) // make cell more visible in our example project
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor(red: 89/255, green: 77/255, blue:62/266, alpha:1.0).cgColor
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        selectedCell = indexPath.item
    }
    
    
    // Prepare for selection
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailsSegue"{
            
            let detailsVC = segue.destination as! DetailsViewController
            let cell = sender as! MyCollectionViewCell
            let path = self.collectionView.indexPath(for: cell)?.item
            detailsVC.titleText = roster.characters[path!].name
            detailsVC.image = roster.characters[path!].mainImage
            detailsVC.bioText = roster.characters[path!].bio
            print("succeeded")
            
        }
    }
}

