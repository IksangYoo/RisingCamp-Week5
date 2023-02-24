//
//  User.swift
//  Week5
//
//  Created by Iksang Yoo on 2023/02/24.
//

import Foundation


class User {
    
    static let shared = User()
    
    var name : String?
    var email: String?
    var imageURL: URL? {
        didSet {
            
        }
    }
    
    private init() { }
}
