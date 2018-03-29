//
//  ViewController.swift
//  Kitchen Help
//
//  Created by Miranda Richardson on 2/5/18.
//  Copyright © 2018 Miranda Richardson. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UITableViewController,  GIDSignInUIDelegate {

    override func viewDidLoad(){
        super.viewDidLoad()
        
        setupGoogleButtons()
    }
    
    fileprivate func setupGoogleButtons(){
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 60, y: 500, width: view.frame.width - 116, height: 50)
        view.addSubview(googleButton)
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    @IBAction func SignOutButton(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }

}

