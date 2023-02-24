//
//  LoginViewController.swift
//  Week5
//
//  Created by Iksang Yoo on 2023/02/24.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet var loginButton: GIDSignInButton!
    let loginConfig = GIDConfiguration(clientID: "692394764141-3p8ntlcotcviaso7lnnph2em41kk5a51.apps.googleusercontent.com")
    let user = User.shared
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loginButton.style = .wide
        loginButton.colorScheme = .light
        
    }
    
    @IBAction func login(_ sender: GIDSignInButton) {
        
        guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") else { return }
        GIDSignIn.sharedInstance.signIn(with: loginConfig, presenting: self) { result, error in
            
            guard error == nil else { return }
            guard let userProfile = result?.profile else { return }
            
            self.user.name = userProfile.name
            self.user.email = userProfile.email
            self.user.imageURL = userProfile.imageURL(withDimension: 0)
            
            homeVC.modalTransitionStyle = .coverVertical
            self.present(homeVC, animated: true)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateUI"), object: nil)
        }
    }
}
