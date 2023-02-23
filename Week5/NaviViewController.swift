//
//  NaviViewController.swift
//  Week5
//
//  Created by Iksang Yoo on 2023/02/23.
//

import UIKit
import KakaoSDKNavi

class NaviViewController: UIViewController {
    var store = Store()
    override func viewDidAppear(_ animated: Bool) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let options = NaviOption(coordType: .WGS84)
        
        let destination = NaviLocation(name: store.name!, x: String(store.x!), y: String(store.y!))
//        let viaList = [NaviLocation(name: "판교역 1번출구", x: "321525", y: "532951")]
        guard let navigateUrl = NaviApi.shared.navigateUrl(destination: destination, option: options) else {
            return
        }

        if UIApplication.shared.canOpenURL(navigateUrl) {
            UIApplication.shared.open(navigateUrl, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(NaviApi.webNaviInstallUrl, options: [:], completionHandler: nil)
        }
    }

}
