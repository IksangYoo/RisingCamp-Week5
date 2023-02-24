//
//  ProfileViewController.swift
//  Week5
//
//  Created by Iksang Yoo on 2023/02/24.
//

import UIKit
import GoogleSignIn
import Kingfisher

class ProfileViewController: UIViewController {
    
    let user = User.shared
    
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        updateUI()
    }
    
    @IBAction func signout(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signOut()
        dismiss(animated: true)
    }
    
    func updateUI() {
        nameLabel.text = user.name
        emailLabel.text = user.email
        profileImageView.kf.setImage(with: user.imageURL)
    }
}
