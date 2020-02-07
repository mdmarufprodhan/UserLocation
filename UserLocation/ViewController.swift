//
//  ViewController.swift
//  UserLocation
//
//  Created by Md Maruf Prodhan on 2/7/20.
//  Copyright © 2020 Md Maruf Prodhan. All rights reserved.
//

import UIKit
import  MapKit
import  CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        CheckLocationServices()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupLocationManager(){
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func CheckLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
          // setup our location manager
            setupLocationManager()
            checkLocationAuthorization()
        }
        else{
            //show alart letting user they have to turn this on
        }
        
        
    }
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            // Do Map stuff
            break
        case .denied:
            // show alart instruction than how to turn on permission
        
            break
        case .notDetermined:
          locationManager.requestWhenInUseAuthorization()
            //break
        case .restricted:
           // show an alert letting them know what's up
            break
        case .authorizedWhenInUse:
            break
        case .authorizedAlways:
            break
        }
    }
}



extension ViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // We'll be Back
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
       // we'll be back
    }
    
    
    
    
}

