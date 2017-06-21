//
//  Place.swift
//  MapApp
//
//  Created by Zhanserik on 6/19/17.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    var lat: Double = 0
    var lon: Double = 0
    var title: String?
    var subtitle: String?
    var pinTintColor: UIColor
    init(lat: Double, lon: Double, title: String, subtitle: String, pinTintColor: UIColor) {
        self.lat = lat
        self.lon = lon
        self.title = title
        self.subtitle = subtitle
        self.pinTintColor = pinTintColor
    }
}
