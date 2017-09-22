//
//  HomeViewController.swift
//  PerfectNews
//
//  Created by Alumno-DG on 21/09/17.
//  Copyright © 2017 Alumno-DG. All rights reserved.
//

import UIKit
import FirebaseAuth
import FBSDKCoreKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lblNomUser: UILabel!
    @IBOutlet weak var articuloTableView: UITableView!
    
    @IBAction func btnLogout(_ sender: Any) {
    
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            FBSDKAccessToken.setCurrent(nil)
            
            let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "Main")
            self.present(viewController, animated: true, completion: nil)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = Auth.auth().currentUser
        if let user = user {

            /*let uid = user.uid
            let email = user.email
            let photoURL = user.photoURL*/
            
            let nom = user.displayName
            
            let firstWord:String = nom!.components(separatedBy: " ").first!
            self.lblNomUser.text = "Hi, \(firstWord)"
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "articuloTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ArticuloTableViewCell
        
        //cell.objAutos = arrayAuto[indexPath.row]
        //cell.actualizarData()
        cell.lblTituArt.text = "Hola"
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    


}
