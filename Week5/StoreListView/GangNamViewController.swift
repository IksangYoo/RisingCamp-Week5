//
//  GangNamViewController.swift
//  Week5
//
//  Created by Iksang Yoo on 2023/02/22.
//

import UIKit

class GangNamViewController: UIViewController {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    let storeList = StoreList.shared
    let request = StoreRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request.delegate = self
        request.getStoreData()
    }
}

extension GangNamViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeList.gangNamStores?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? StoreCell else {
            return UITableViewCell()
        }
        cell.updateUI(stores: storeList.gangNamStores!, at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let naviVC = self.storyboard?.instantiateViewController(withIdentifier: "NaviVC") as? NaviViewController else {return}
        naviVC.store = storeList.gangNamStores![indexPath.row]
        self.present(naviVC, animated: true)
        print(storeList.gangNamStores![indexPath.row].name!)
    }
}

extension GangNamViewController: StoreRequestProtocol {
    
    func retrieveStore(storeResponse: StoreResponse) {

        let response = storeResponse.crtfcUpsoInfo.row
        var stores = [Store]()
        
        for i in 0..<response.count {
            let store = response[i]
            stores.append(Store(name: store.upsoNm, guName: store.cggCodeNm, x: Double(store.xCnts)!, y: Double(store.yDnts)!, address: store.rdnCodeNm, telNo: store.telNo))
            
        }
        storeList.AllStores = stores
        
        tableView.reloadData()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadGangBook"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadGwanAk"), object: nil)
    }
}

class StoreCell: UITableViewCell {
 
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var telNoLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    func updateUI(stores: [Store], at: Int) {
        let store = stores[at]
        nameLabel.text = store.name
        telNoLabel.text = store.telNo
        addressLabel.text = store.address
    }
}


