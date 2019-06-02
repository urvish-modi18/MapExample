//
//  ViewController.swift
//  MapExample
//
//  Created by Urvish D Modi on 02/06/19.
//  Copyright © 2019 Urvish D Modi. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loadMapView()
    }

// Create Map View
    func loadMapView() {
        
        let states = self.getData()
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.setMinZoom(10, maxZoom: 15)
        view = mapView
        
        self.setMarkers(mapView: mapView, states: states)
    }
    
    // Get Data, rendering static data
    func getData() -> [State]{
    
        let states = [
            State(name: "Stony Hill Vineyard", long: -122.5300854, lat: 38.5356979),
            State(name: "Pestoni Family Estate Winery", long: -122.4356324, lat: 38.47159),
            State(name: "Honig Vineyard & Winery", long: -122.407193, lat: 38.472837),
        ]
        
        return states
        
    }

    // Set Markers on view
    func setMarkers(mapView:GMSMapView,states:[State]) {
        
        for state in states {
            let state_marker = GMSMarker()
            state_marker.position = CLLocationCoordinate2D(latitude: state.lat, longitude: state.long)
            state_marker.title = state.name
            state_marker.snippet = "Area: \(state.name)"
            state_marker.map = mapView
        }
        
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        
        // tap event handled by delegate
        return true
    }
    
}

struct State {
    let name: String
    let long: CLLocationDegrees
    let lat: CLLocationDegrees
}
