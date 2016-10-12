//
//  ViewController.swift
//  Trump vs Hillary
//
//  Created by Kiddos on 10/12/16.
//  Copyright © 2016 Team Apps. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase
import SwiftKeychainWrapper

class ViewController: UIViewController {
    
    @IBAction func facebookLoginTapped(_ sender: AnyObject) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (user, error) in
           // ProgressHUD.show("logging in...")
            if error != nil {
                //ProgressHUD.show("logging in...")
               // ProgressHUD.showError("Oops, \(error?.localizedDescription)")
            } else if user?.isCancelled == true {
               // ProgressHUD.show("logging in...")
               // ProgressHUD.showError("Facebook Login Cancelled")
            } else {
                //ProgressHUD.dismiss()
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                //ProgressHUD.showError("Oops, \(error?.localizedDescription)")
            } else {
                print("connected to server...")
                if let user = user {
                    let userData = ["provider": credential.provider]
                    self.completeSignIn(id: user.uid, userData: userData)
                }
            }
        })
    }
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        let keychainResult = KeychainWrapper.setString(id, forKey: KEY_UID)
        print("KOU: Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "VOTE", sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
    }
}

