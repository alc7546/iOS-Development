//
//  AppDelegate.swift
//  Project-2
//
//  Created by Andrew Clark (RIT Student) on 4/15/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        loadData()
        UITabBar.appearance().tintColor = UIColor(red: 255/255, green: 196/255, blue: 32/255, alpha: 1.0)
        UITabBar.appearance().barTintColor = UIColor(red: 85/255, green: 90/255, blue: 99/255, alpha: 0.8)
        return true
    }
    
    // load data in from known json file named characterData
    func loadData(){
        guard let path = Bundle.main.url(forResource: "characters", withExtension: "json") else{
            print("Error: could not find the characterData.json file")
            return
        }
        
        do{
            let data = try Data(contentsOf: path)
            if let json = try JSONSerialization.jsonObject(with: data) as? [String:Any?]{
                parse(json:json)
            }
        } catch {
            print("Error: could not initialize the json data: \(error)")
        }
    }
    
    // Parse out the JSON from the characterData file
    func parse(json: [String:Any]){
        var characters = [Character]()
        
        // If a json object with the characters key exists, assign it to this array
        guard let charactersArrayJSON = json["characters"] as? [AnyObject] else{
            print("Error: Could not find the 'characters' key")
            return
        }
        
        // Check each object in json file
        for character in charactersArrayJSON{
            // File is specifically laid out, will be parsed in order it is laid out
            let name = character["name"] as? String ?? "No Name" // grab name
            
            // Grab the bio as a String
            let bio = character["bio"] as? String ?? "No Available Bio"
            
            // Grab main image as a String
            let mainImageString = character["mainImage"] as? String ?? "PlaceHolder Image"
            // Convert string image to UIImage
            let mainImage = UIImage(named: mainImageString)
            
            // Grab Roster Icon as a String
            let rosterIconString = character["icon"] as? String ?? "PlaceHolder Icon"
            let rosterIcon = UIImage(named: rosterIconString)
            let newCharacter = Character(name: name, bio: bio, mainImage: (mainImage)!, rosterIcon: (rosterIcon)!)
            characters.append(newCharacter)
            print(newCharacter)
        }
        Roster.shared.characters = characters
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

