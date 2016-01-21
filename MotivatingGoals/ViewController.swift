//
//  ViewController.swift
//  MotivatingGoals
//
//  Created by Heidi Yee on 1/20/16.
//  Copyright © 2016 Heidi Yee. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.login()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    // Mark: Parse Log In/ Sign up
    
    func login() {
        if PFUser.currentUser() == nil {
            let loginViewController = PFLogInViewController()
            loginViewController.delegate = self
            loginViewController.signUpController?.delegate = self
            self.navigationController?.presentViewController(loginViewController, animated: true, completion: nil)
        } else {
            self.setupLogoutNavButton()
        }
        
    }
    
    func logout() {
        PFUser.logOut()
        self.login()
    }
    
    func setupLogoutNavButton() {
        let signoutButton = UIBarButtonItem(title: "Sign Out", style: UIBarButtonItemStyle.Plain, target: self, action:"logout")
        self.navigationItem.leftBarButtonItem = signoutButton
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.setupLogoutNavButton()
    }

    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.setupLogoutNavButton()
    }

}

