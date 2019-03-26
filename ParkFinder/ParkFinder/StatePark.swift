//
//  StatePark.swift
//  ParkFinder
//
//  Created by Andrew Clark (RIT Student) on 3/26/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

public class StatePark: NSObject, MKAnnotation {
    private var name: String
    private var latitude: Double
    private var longitude: Double
    
    public var title:String?{
        return name
    }
    
    public var subtitle: String?{
        return "I <3 NY"
    }
    init(name: String, latitude: Double, longitude: Double){
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public override var description: String {
        return "\(name): (\(latitude),\(longitude))"
    }
    
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(CLLocationDegrees(latitude), CLLocationDegrees(longitude))
    }
}
