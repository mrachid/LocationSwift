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

class SecondViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, APILocationDelegate, UITextFieldDelegate{

    let LocationManager = CLLocationManager()
    
    var locationCity = City()
    
    var searchText : String?{
        didSet{
            reseachCity()
        }
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var searchCityText: UITextField!{
        didSet{
            searchCityText.delegate = self
            searchCityText.text = searchText
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        searchText = textField.text
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        putPinOnTheMap(locationCity.cityHistory.first!)
    }
    
    @IBAction func changeMapType(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Satellite
        case 2:
            mapView.mapType = .Hybrid
        default:
            break
        }
    }
   
    func reseachCity() {
        
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(searchText!, completionHandler: { placemarks, error in
            if error != nil {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                // Get the first placemark
                let placemark = placemarks[0]
                
                // Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.searchText
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    // Display the annotation
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
            
        })

    }
    
    func putPinOnTheMap(city : (String,String,String)) {
        print(city)
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(city.2, completionHandler: { placemarks, error in
            if error != nil {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                // Get the first placemark
                let placemark = placemarks[0]
                
                // Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = city.0
                annotation.subtitle = city.1
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                }
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
                
                
            }
            
        })       
    }
    
    // MARK Refresh localisation current User
        
    @IBAction func resfreshCurrentPosition(sender: UIButton) {
        LocationManager.requestWhenInUseAuthorization()
        LocationManager.delegate = self
        LocationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        LocationManager.distanceFilter = 10
        LocationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.mapView.setRegion(region, animated: true)
        LocationManager.stopUpdatingLocation()
    }
    
}

