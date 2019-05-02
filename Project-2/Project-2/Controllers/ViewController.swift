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
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25"]
    var roster = Roster.shared
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedCell: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(roster.characters.count)
    }
    // MARK: - UICollectionViewDataSource protocol
    
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.items[indexPath.item]
        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        selectedCell = indexPath.item
        print(selectedCell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailsSegue"{
            
            let detailsVC = segue.destination as! DetailsViewController
            let cell = sender as! MyCollectionViewCell
            let path = self.collectionView.indexPath(for: cell)?.item
            print(path)
            detailsVC.titleText = roster.characters[path!].charName!
            detailsVC.image = TestModel.test.mainImage
            detailsVC.bioText = TestModel.test.bio
            print("succeeded")
            print(cell.myLabel.text!)
        }
    }
}

