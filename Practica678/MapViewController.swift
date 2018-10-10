//
//  UserViewController.swift
//  Practica
//
//  Created by OscarVago 25/09/18.
//  Copyright © 2018 DosDesign. All rights reserved.

import UIKit
import MapKit

final class Anotacion: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    init(cordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate=cordinate
        self.title=title
    }
    var region: MKCoordinateRegion{
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}

class MapViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var map: MKMapView!
    
    var name: String?
    var lat: Double?
    var lng: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//point in map
       
        title = name
        map.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let cordenada = CLLocationCoordinate2D(latitude: lat!, longitude: lng!)
        let anotacion = Anotacion(cordinate: cordenada, title: name!)
       
        
        map.addAnnotation(anotacion)
        
       
        //map.setRegion(anotacion.region, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }

    
}
