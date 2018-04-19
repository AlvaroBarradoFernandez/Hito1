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

class VCMapa: UIViewController, CLLocationManagerDelegate {
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations[0])
        self.nuevaRegionMapa(latuitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
    }

    func nuevaRegionMapa(latuitude lat: Double, longitude lon:Double) {
        let miSpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let puntoCentro:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let miRegion:MKCoordinateRegion = MKCoordinateRegion(center: puntoCentro, span:miSpan)
        miMapa?.setRegion(miRegion, animated: true)
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