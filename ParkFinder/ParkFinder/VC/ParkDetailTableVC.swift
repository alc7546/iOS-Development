//
//  ParkDetailTableVC.swift
//  ParkFinder
//
//  Created by Student on 3/26/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class ParkDetailTableVC: UITableViewController {

    var park:StatePark?
    let numSections = 4
    enum MySection:Int{
        case title=0,description,favorite,viewOnMap
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = park?.title
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return numSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "plainCell", for: indexPath)

        switch indexPath.section{
        case MySection.title.rawValue:
            cell.textLabel?.text = park?.title
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            cell.textLabel?.numberOfLines = 1
            cell.textLabel?.textAlignment = .left
        case MySection.description.rawValue:
            cell.textLabel?.text = park?.description
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.textAlignment = .left
        case MySection.favorite.rawValue:
            cell.textLabel?.text = "Favorite"
            cell.textLabel?.textColor = view.tintColor
            cell.textLabel?.font = UIFont.systemFont(ofSize: 18)
            cell.textLabel?.numberOfLines = 1
            cell.textLabel?.textAlignment = .center
        case MySection.viewOnMap.rawValue:
            cell.textLabel?.text = "View on Map"
            cell.textLabel?.textColor = view.tintColor
            cell.textLabel?.font = UIFont.systemFont(ofSize: 18)
            cell.textLabel?.numberOfLines = 1
            cell.textLabel?.textAlignment = .center
        default:
            cell.textLabel?.text = "TBD"
        }
        

        return cell
    }
    
    // MARK: - Table View Delegate Methods -
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == MySection.favorite.rawValue{
            return 54.0
        }
        
        if indexPath.section == MySection.description.rawValue{
            return 230.0
        }
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == MySection.favorite.rawValue{
            print("favorite section tapped")
        }
        if indexPath.section == MySection.viewOnMap.rawValue{
            let nc = NotificationCenter.default
            let data = ["park": park]
            print(data)
            nc.post(name: showParkNotification, object:self, userInfo: data)
            print("viewOnMap section tapped")
        }
        
        
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
