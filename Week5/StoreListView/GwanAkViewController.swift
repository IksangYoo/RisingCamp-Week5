//
//  GwanAkViewController.swift
//  Week5
//
//  Created by Iksang Yoo on 2023/02/22.
//

import UIKit

class GwanAkViewController: UIViewController {
    
    let storeList = StoreList.shared
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "loadGwanAk"), object: nil)
    }
    
    @objc func loadList(notification: NSNotification){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


extension GwanAkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeList.gwanAkStores?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? StoreCell else {
            return UITableViewCell()
        }
        cell.updateUI(stores: storeList.gwanAkStores!, at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension GwanAkViewController: StoreRequestProtocol {
    
    func retrieveStore(storeResponse: StoreResponse) {
        tableView.reloadData()
    }
}
