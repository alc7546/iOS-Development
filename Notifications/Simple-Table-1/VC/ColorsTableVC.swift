//
//  ColorsTableVCTableViewController.swift
//  Simple-Table-1
//
//  Created by Andrew Clark (RIT Student) on 2/11/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class ColorsTableVC: UITableViewController {
    
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
        
        if isPad{
            let nc = NotificationCenter.default
            
            // create dictionary for the data
            let data = ["color": selectedColor]
            
            // broadcast the notification
            nc.post(name:myColorChangedNotification, object:self, userInfo: data)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DoneTapped"{
            print("In prepareForSegue in ColorTableVC with selectedColor = \(selectedColor))")
        }
    }

    

}
