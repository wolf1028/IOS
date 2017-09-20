//
//  ViewController.swift
//  PerfectNews
//
//  Created by Alumno-DG on 19/09/17.
//  Copyright © 2017 Alumno-DG. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        loginButton.center = view.center
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        view.addSubview(loginButton as? UIView ?? UIView())

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

