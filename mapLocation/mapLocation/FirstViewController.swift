//
//  FirstViewController.swift
//  mapLocation
//
//  Created by Rachid on 13/10/2016.
//  Copyright © 2016 Rachid. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.reloadData()
        }
    }
        
    var locationCity = City()
    
    
    private struct Storyboard{
        static let cityCellIdentifier = "cityCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationCity.cityHistory.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.cityCellIdentifier, forIndexPath: indexPath)
        
        cell.textLabel?.text = locationCity.cityHistory[indexPath.row].0
        cell.detailTextLabel?.text = locationCity.cityHistory[indexPath.row].2
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        for vcc in (tabBarController?.viewControllers)!{
            if let controller = vcc as? SecondViewController{
                controller.putPinOnTheMap(locationCity.cityHistory[indexPath.row])
                tabBarController?.selectedIndex = 1
            }
        }
    }
}

