//
//  VCMapaViewController.swift
//  Hito1
//
//  Created by Alvaro Barrado on 19/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class VCMapa: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
@IBOutlet var miMapa:MKMapView?
    var locationManager:CLLocationManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        miMapa?.showsUserLocation = true
        self.agregarPin(titulo: "Hola", latitude: 42, longitud: -3)
        self.agregarPin(titulo: "Hola", latitude: 47, longitud: -6)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("------>>>>>>>", locations[0])
        let mispan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let tmpregion:MKCoordinateRegion = MKCoordinateRegion(center:locations[0].coordinate, span:mispan)
        
//        miMapa?.setRegion(tmpregion, animated: false)
    }

    
    func agregarPin(titulo:String, latitude lat:Double, longitud lon:Double){
        let miannotation:MKPointAnnotation = MKPointAnnotation()
        miannotation.coordinate.latitude = lat
        miannotation.coordinate.longitude = lon
        miannotation.title=titulo
        miMapa?.addAnnotation(miannotation)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
