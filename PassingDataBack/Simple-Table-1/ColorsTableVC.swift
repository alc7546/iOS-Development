//
//  ColorsTableVCTableViewController.swift
//  Simple-Table-1
//
//  Created by Andrew Clark (RIT Student) on 2/11/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class ColorsTableVC: UITableViewController {

    // Tuple way
    //var colors:[(name: String, value:UIColor)] = [] // empty array
    
    // Background Color Class
    var colors = [BackgroundColor]()
    var red = BackgroundColor(name:"Red", value:UIColor.red)
    var blue = BackgroundColor(name: "Blue", value:UIColor.blue)
    var green = BackgroundColor(name: "Green", value:UIColor.green)
    
    var colors2 = [[String:UIColor]]()
    var selectedColor = UIColor.red // default value to avoid nil
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "Colors"
        print(#function + " called ")
        
        // Using BackgroundColor Model class
        colors.append(red)
        colors.append(blue)
        colors.append(green)
        
        // Tuple way
        // colors.append((name:"Red", value:UIColor.red))
        // colors.append(contentsOf: [(name:"Green", value:UIColor.green)])
        // colors += [(name:"Blue", value:UIColor.blue)]
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(#function + " called with numberOfRowsInSection \(section) =\(colors.count)")
        return colors.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleCell", for: indexPath)
        
        // Configure the cell...
        let t = colors[indexPath.row]
        let name = t.name
        cell.textLabel?.text = name
        print(#function + " called with indexPath = \(indexPath), the data for this row is \(colors[indexPath.row])")
        return cell
    }
    
    //MARK: - Actions
    @IBAction func cancelTapped(){
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedColor = colors[indexPath.row].value
        print(selectedColor)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DoneTapped"{
            print("In prepareForSegue in ColorTableVC with selectedColor = \(selectedColor))")
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
