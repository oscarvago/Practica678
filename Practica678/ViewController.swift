//
//  ViewController.swift
//  Practica678
//
//  Created by MTI on 25/09/18.
//  Copyright © 2018 MTI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var usuarios = [Usuario]()
    var usuario = usuario?
    var user = user?
    
    override func viewDidLoad() {
     
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
        //string de url
        let urlString = "https://jsonplaceholder.typicode.com/users"
        //objetp url
        let url = URL(string:urlString)
        // peticion
        let peticion = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            //verificar si hay error
            
            if(error != nil){
                print("Error: \(String(describing: error))")
            }
            else{
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String: AnyObject]]
                    print(json)
                    //llenado contenedor local (usuarios)
                    
                    for element in json{
                        let name = user["name"] as! String
                        let email = user["email"] as! String
                        let phone = user["phone"] as! String
                        let address = user["address"] as! [String: AnyObject]
                        let geo = address["geo"] as! [String: AnyObject]
                        let lat = Double(geo["lat"] as! String)
                        let lng = Double(geo["lng"] as! String)
                        
                        
                        self.usuarios.append(Usuario(name:name, email: email, phone: phone, lat: lat!, lng: lng!))
                        
                        
                    }
                    //refrescar la tabla
                    OperationQueue.main.addOperation {
                        self.tableView.reloadData()
                    }
                    
                    
                    } catch let error as NSError{
                    print(error)
                        }
                }
        }
        peticion.resume()


    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usuarios.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usuario")
        
        cell?.textLabel?.text = usuarios[indexPath.row]
        
        
        return cell!
    }
}
class Usuario {
    var name:String
    var email:String
    var phone:String
    var lat:Double
    var lng:Double
    
    init(name:String, email:String, phone:String, lat:Double, lng:Double){
    self.name = name
    self.email = email
    self.phone = phone
    self.lat = lat
    self.lng = lng
    }
}
