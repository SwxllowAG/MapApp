//
//  ViewController.swift
//  MapApp
//
//  Created by Zhanserik on 6/19/17.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import UIKit
import MapKit


var list: [Place] = [
    Place(lat: 40.758896, lon: -73.985130, title: "Times Square", subtitle: "Tourism", pinTintColor: .green),
    Place(lat: 40.689247,  lon: -74.044502, title: "Statue of Liberty", subtitle: "Statue", pinTintColor: .orange),
    Place(lat: 40.715076, lon: -73.991180, title: "Metograph", subtitle: "Cinema", pinTintColor: .yellow),
    Place(lat: 40.785091, lon: -73.968285, title: "Central Park", subtitle: "Park", pinTintColor: .blue),
    Place(lat: 40.7537916, lon: -73.983607, title: "Bryant Park", subtitle: "Park", pinTintColor: .blue),
    Place(lat: 40.703717, lon: -74.016094, title: "Battery Park", subtitle: "Park", pinTintColor: .blue),
    Place(lat: 40.7749969, lon: -73.971496114, title: "American Museum of Natural History", subtitle: "Museum", pinTintColor: .red),
    Place(lat: 40.7562111111, lon: -73.9239638889, title: "Museum of the Moving Image", subtitle: "Museum", pinTintColor: .red),
    Place(lat: 40.74083037, lon: -73.841329968, title: "Queens Museum", subtitle: "Museum", pinTintColor: .red)
]

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
    
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.showsPointsOfInterest = true
        mapView.delegate = self
        
        
        
        for i in 0...list.count-1{
            let place = list[i]
            place.coordinate = CLLocationCoordinate2D(latitude: list[i].lat, longitude: list[i].lon)
            place.title = list[i].title
            place.subtitle = list[i].subtitle
            place.pinTintColor = list[i].pinTintColor
            mapView.addAnnotation(place)
        }
        
    }
    
    func btnAction() {
        someIndex = self.mapView.selectedAnnotations.popLast() as! Place
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "detailViewController") as! detailViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let annotation = view.annotation
        
        let userLocation = mapView.userLocation.location
        
        let annotationLocation = CLLocation(latitude: (annotation?.coordinate.latitude)!, longitude: (annotation?.coordinate.longitude)!)
        
        print(userLocation?.distance(from: annotationLocation) ?? "")
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }
        
        let identifier = "Sample"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            if let annotation = annotation as? Place {
                annotationView?.pinTintColor = annotation.pinTintColor
            }
            
            annotationView?.canShowCallout = true
            let btn = UIButton(type: .detailDisclosure)
            btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
            annotationView?.rightCalloutAccessoryView = btn
            
        } else {
            annotationView?.annotation = annotation
        }
        
        
        return annotationView
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "myAnnotation") as? MKPinAnnotationView
//        
//        if annotationView == nil {
//            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myAnnotation")
//        } else {
//            annotationView?.annotation = annotation
//        }
//        
//        if let annotation = annotation as? Place {
//            annotationView?.pinTintColor = annotation.pinTintColor
//        }
//        
//        return annotationView
//    }
}
