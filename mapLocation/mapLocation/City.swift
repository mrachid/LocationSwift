//
//  City.swift
//  mapLocation
//
//  Created by Rachid on 13/10/2016.
//  Copyright © 2016 Rachid. All rights reserved.
//

import Foundation

class City {
    
    enum cityStatus {
        case Default
        case Recent
    }
    
    var cityHistory: Array<(String,String,String, cityStatus)> = [
        
        ("42", "Ecole", "96 avenue boulevard bessiere, Paris", cityStatus.Default),
        ("Tour Effeil", "Monument", "Champ de Mars, Paris", cityStatus.Default),
        ("Les champs", "Avenue", "Avenue des Champs-Élysées, Paris", cityStatus.Default),
    
    ]
    
    func addCity(city: (String, String, String)) {
        let data = (city.0, city.1, city.2, cityStatus.Recent)
        cityHistory.append(data)
    }
    
    
    
}