//
//  ViewController.swift
//  Kraze
//
//  Created by Utilisateur on 03/04/2019.
//  Copyright © 2019 Utilisateur. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase
import FirebaseDatabase

struct MarkerStruct {
    let name: String
    let lat: CLLocationDegrees
    let long: CLLocationDegrees
}
struct myNewView {
    let nameEvent: String
    let namePlace: String
    let nameTime: String
    let nameSold: String
   
}

class ViewController: UIViewController, GMSMapViewDelegate, UINavigationBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "KRAZE"
        self.view.backgroundColor = UIColor.black
        initGoogle()
    }
    func initGoogle()
    {
        let markers = [
            MarkerStruct(name: "Concrete", lat: 48.843614, long: 2.369382),
            MarkerStruct(name: "wanderlest", lat: 48.840538, long: 2.370516),
        ]
        GMSServices.provideAPIKey("AIzaSyBJZ3asgmPCE7nYkbUQFbxGuNyrd04EieQ")
        let camera = GMSCameraPosition.camera(withLatitude: 48.855652, longitude: 2.350489, zoom: 13)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self
        self.view = mapView
        
        for marker in markers {
            let position = CLLocationCoordinate2D(latitude: marker.lat, longitude: marker.long)
            let locationmarker = GMSMarker(position: position)
            mapView.selectedMarker = locationmarker
            locationmarker.title = marker.name
            locationmarker.map = mapView
        }
    }
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool
    {
        let tapMarker = marker
        if tapMarker === marker
        {
            createview()
            print("✅ tap marker")
        }
        if tapMarker != marker
        {
            print("✅ tap a coter")
            //myNewView.removeFromSuperview()
        }
        print("✅ sortie")
       //let customView = (CGRect(x: 0, y: 0, width: 200, height: 50))
        return (true)
    }
    func createview()
    {
        let myNewView = UIView(frame: CGRect(x: 10, y: 100, width: 355, height: 100))
        myNewView.backgroundColor = UIColor.black
        myNewView.layer.cornerRadius = 25
        self.view.addSubview(myNewView)
        myNewView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: myNewView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: myNewView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 320).isActive = true
        NSLayoutConstraint(item: myNewView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 350).isActive = true
        NSLayoutConstraint(item: myNewView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 150).isActive = true
        
        let label1 = UILabel()
        label1.frame = CGRect(x: 10, y: 10, width: 280, height: 30)
        label1.font = label1.font.withSize(10)
        label1.textColor = UIColor.white
        
        let label2 = UILabel()
        label2.frame = CGRect(x: 10, y: 30, width: 280, height: 30)
        label2.font = label2.font.withSize(10)
        label2.textColor = UIColor.white
        
        let label3 = UILabel()
        label3.frame = CGRect(x: 10, y: 50, width: 50, height: 20)
        label3.font = label3.font.withSize(10)
        label3.textColor = UIColor.white
        
        var imageView : UIImageView
        imageView  = UIImageView(frame:CGRect(x: 250, y: 50, width: 60, height: 60))
        imageView.image = UIImage(named:"shield")
        myNewView.addSubview(imageView)
        


        let ref = Database.database().reference()
        ref.child("Events").child("1999").child("1555185600000").observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let username = value?["name"] as? String ?? "❌ no Events"
            label1.text = username
        }
    
       let ref2 = Database.database().reference()
        ref2.child("Events").child("1999").child("1555185600000").child("place").observeSingleEvent(of: .value) {
            (snapshot) in
            if snapshot.hasChild("name") {
                print("✅ OK1")
            }
            let value1 = snapshot.value as? NSDictionary
            let username = value1?["name"] as? String ?? "❌ no place"
            label2.text = username
        }
        
        let ref3 = Database.database().reference()
        ref3.child("Events").child("1999").child("1555185600000").child("tags").observeSingleEvent(of: .value) {
            (snapshot) in
            if snapshot.hasChild("electronique") {
                print("✅ OK2")
            }
            let value2 = snapshot.value as? NSDictionary
            let username = value2?["electronique"] as? String ?? "❌ no tags"
            label3.text = username
        }
        myNewView.addSubview(label1)
        myNewView.addSubview(label2)
        myNewView.addSubview(label3)
    }
}

