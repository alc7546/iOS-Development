//
//  AppDelegate.swift
//  ParkFinder
//
//  Created by Andrew Clark (RIT Student) on 3/26/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        loadData()
        return true
    }
    
    // Load data in from known json file named parks,
    func loadData(){
        
        guard let path = Bundle.main.url(forResource: "parks", withExtension: "json") else {
            print("Error: could not find path parks.json")
            return // bail
        }
        
        do{
            
            let data = try Data(contentsOf: path)
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]{
                parse(json: json)
            }
        } catch {
            print("Error: Could not initialize the json data: \(error)")
        }
    }
    
    // Parse out JSON, specifically from the parks file
    func parse(json: [String:Any]){
        //print("json: \(String(describing: json))")
        var parks = [StatePark]()
        // If there exists a json object with the parks key, assign to the array
        guard let parksArrayJSON = json["parks"] as? [AnyObject] else{
            print("Error: Could not find the `parks` key")
            return
        }
        //print("parksArrayJSON: \(String(describing: parksArrayJSON))")
        
        // Check if its a string, if so assign to name, otherwise give "No Name"
        for park in parksArrayJSON{
            let name = park["name"] as? String ?? "No Name"
            
            
            // Grab string rep first and then convert to double
            let latitudeString = park["latitude"] as? String ?? "0.0"
            let latitude = Double(latitudeString) ?? 0.0
            
            
            // Do the same for longitude
            let longitudeString = park["longitude"] as? String ?? "0.0"
            let longitude = Double(longitudeString) ?? 0.0
            
            
            let newPark = StatePark(name: name, latitude: latitude, longitude: longitude)
            parks.append(newPark)
            print(newPark)
        }
        ParkData.shared.parks = parks
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

