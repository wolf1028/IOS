//
//  ViewController.swift
//  PerfectNews
//
//  Created by Alumno-DG on 19/09/17.
//  Copyright © 2017 Alumno-DG. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var loginButton = FBSDKLoginButton()
    
    @IBOutlet weak var actIdent: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButton.isHidden = true
        
        _ = Auth.auth().addStateDidChangeListener { (auth, user) in
            if Auth.auth().currentUser != nil {
                let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let homeViewController : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "Home")
                self.present(homeViewController, animated: true, completion: nil)
                
            } else {
                self.loginButton.center = self.view.center
                self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
                self.loginButton.delegate = self
                self.view.addSubview(self.loginButton)
                self.loginButton.isHidden = false
            }
        }
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("Logeded in")
        
        self.loginButton.isHidden = true
        self.actIdent.startAnimating()
        
        if(error != nil){
            self.loginButton.isHidden = false
            self.actIdent.stopAnimating()
        }
        else if(result.isCancelled){
            self.loginButton.isHidden = false
            self.actIdent.stopAnimating()
        }
        else{
            let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            Auth.auth().signIn(with: credential) { (user, error) in
                if let error = error {
                    print(error)
                    return
                }
                
                print("user is logged in to FireBaseApp")
                
            }
        }
        
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Logout")
    }
}

