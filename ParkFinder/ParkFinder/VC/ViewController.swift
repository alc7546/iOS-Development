//
//  ViewController.swift
//  ParkFinder
//
//  Created by Andrew Clark (RIT Student) on 3/26/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let metersPerMile:Double = 1609.344
    var parks = [StatePark]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        loadData()
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
        mapView.addAnnotations(ParkData.shared.parks)
        print(parks[0].coordinate)
        
        //let mySpan = MKCoordinateSpan(latitudeDelta: 80, longitudeDelta: 90)
        let myRegion = MKCoordinateRegionMakeWithDistance(parks[0].coordinate, metersPerMile * 100, metersPerMile * 100)
        mapView.setRegion(myRegion, animated: true)
        mapView.selectAnnotation(parks[0], animated: true)
    }
    
    
    // MARK: - MKMapViewDelegate Protocol Methods -
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let title = view.annotation?.title ?? "no title found"{
        print("Tapped \(String(describing: title))")
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? StatePark else{
            print("This annotation isn't a StatePark")
            return nil
        }
        
        let identifier = "pinIdentifier"
        let view: MKPinAnnotationView
        if let dequedview = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView{
            dequedview.annotation = annotation
            view = dequedview
        } else {
            // make new view and put button in it
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type:.detailDisclosure) as UIView
        }
        return view
    }
    
    func mapView(_mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccesoryControlTapped control: UIControl){
        guard let annotation = view.annotation as? StatePark else{
            print("This annotation isn't a StatePark")
            return
        }
        print("Tapped info button for \(annotation.description)")
        // Maybe add something like a url to open maps app and show location ?
    }
    
    
    func showMap(notification:Notification){
        tabBarController?.selectedIndex = 0
        
        if let park = notification.userInfo?["park"] as? MKAnnotation{
            mapView.selectAnnotation(park, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

