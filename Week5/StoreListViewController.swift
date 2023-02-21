//
//  StoreListViewController.swift
//  Week5
//
//  Created by Iksang Yoo on 2023/02/21.
//

import UIKit

class StoreListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        StoreRequest().getStoreData(self)
    }
    
    func didSuccess(_ response: StoreResponse) {
        for i in 0..<response.crtfcUpsoInfo.row.count {
            print(response.crtfcUpsoInfo.row[i])
        }
    }
    
}
