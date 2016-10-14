//
//  City.swift
//  mapLocation
//
//  Created by Rachid on 13/10/2016.
//  Copyright © 2016 Rachid. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class City {
    
    let cityHistory: Array<(String,String,String)> = [
        
        ("42", "Ecole Informatique", "96 avenue boulevard bessiere, Paris"),
        ("Tour Effeil", "Monument Historique", "Champ de Mars, Paris"),
        ("Les Champs Élysées", "Avenue de Paris", "Avenue des Champs-Élysées, Paris"),
    
    ]
    
    var currentCity: (String,String,String)?
    
//    var cordinateCity = MKPointAnnotation()
//    
//    func getLocationCity(city : (String,String,String)) {
//        
//        let geoCoder = CLGeocoder()
//        geoCoder.geocodeAddressString(city.2, completionHandler: { placemarks, error in
//            if error != nil {
//                print(error)
//                return
//            }
//            
//            if let placemarks = placemarks {
//                // Get the first placemark
//                let placemark = placemarks[0]
//                
//                // Add annotation
//                self.cordinateCity.title = city.0
//                self.cordinateCity.subtitle = city.1
//                
//                if let location = placemark.location {
//                    self.cordinateCity.coordinate = location.coordinate
//                }
//                print("latitude \(self.cordinateCity.coordinate.latitude) et longitude \(self.cordinateCity.coordinate.longitude)")
//               
//
//            }
//            
//        })
//    }

}