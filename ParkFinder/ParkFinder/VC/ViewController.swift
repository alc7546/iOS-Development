//
//  ViewController.swift
//  ParkFinder
//
//  Created by Andrew Clark (RIT Student) on 3/26/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit
import MapKit

let showParkNotification = NSNotification.Name("showParkNotification")

class ViewController: UIViewController, MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    let metersPerMile:Double = 1609.344
    var parkData:ParkData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        // Notification
        let nc = NotificationCenter.default
        // register object as an observer
        nc.addObserver(self, selector: #selector(showMap), name: showParkNotification, object: nil)
        
        // Assign Map View annotations and default setting
        mapView.addAnnotations(parkData.parks)
        let myRegion = MKCoordinateRegionMakeWithDistance(parkData.parks[0].coordinate, metersPerMile * 100, metersPerMile * 100)
        mapView.setRegion(myRegion, animated: true)
        mapView.selectAnnotation(parkData.parks[0], animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
    
    
    @objc func showMap(notification:Notification){
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

