//
//  BookmarkDetailTableVC.swift
//  Bookmarker
//
//  Created by jefferson on 10/23/16.
//  Copyright © 2016 tony. All rights reserved.
//

import UIKit

class BookmarkDetailTableVC: UITableViewController {
    let simpleCell = "simpleCell"
    let numSections = 3
    let rowsPerSection = 1
    enum MySection: Int {
        case title = 0, description, viewOnWeb
    }
    

    var bookmark:Bookmark?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return numSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsPerSection
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: simpleCell, for: indexPath)

        // Configure the cell...
        if indexPath.section == MySection.title.rawValue{
            cell.textLabel?.text = bookmark?.name
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 24.0)
        }
        
        // Configure the cell...
        if indexPath.section == MySection.description.rawValue{
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "We could add a description of the link here, tags, etc ..."
            cell.textLabel?.font = UIFont.systemFont(ofSize: 18.0)
        }
        
        if indexPath.section == MySection.viewOnWeb.rawValue{
            cell.textLabel?.text = "View on web"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 18.0)
            cell.textLabel?.textColor = view.tintColor // clickable blue
            cell.textLabel?.textAlignment = NSTextAlignment.center
        }


        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == MySection.title.rawValue{
            return 54.0
        }
        
        if indexPath.section == MySection.description.rawValue{
            return 120.0
        }
        
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: (bookmark?.url)!){
            UIApplication.shared.open(
                url,
                options:[:],
                completionHandler: {
                    (success) in
                    print("Open \(url.description) - success = \(success)")
                }
            )
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
