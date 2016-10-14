//
//  SecondViewController.swift
//  mapLocation
//
//  Created by Rachid on 13/10/2016.
//  Copyright © 2016 Rachid. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SecondViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, APILocationDelegate{

    let LocationManager = CLLocationManager()
    var locationCity = City()
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchCityText: UITextField!{
        didSet{
            //refresh locationCity
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocationCity()
    }
    
    @IBAction func changeMapType(sender: UISegmentedControl) {
        //Change MapView Type
    }
    
    @IBAction func refreshCurrentPosition(sender: UIBarButtonItem) {
        LocationManager.requestWhenInUseAuthorization()
        LocationManager.delegate = self
        LocationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        LocationManager.distanceFilter = 10
        LocationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue: CLLocationCoordinate2D = LocationManager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        LocationManager.stopUpdatingLocation()
    }
    
    func getLocationCity() {
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString("118 rue rateau 93120", completionHandler: { placemarks, error in
            if error != nil {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                // Get the first placemark
                let placemark = placemarks[0]
                
                // Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = "La courneuve"
                annotation.subtitle = "Appt"
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    // Display the annotation
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
            
        })

    }
}

