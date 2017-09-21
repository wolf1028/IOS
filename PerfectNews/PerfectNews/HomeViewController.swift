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

class HomeViewController: UIViewController {
    
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
