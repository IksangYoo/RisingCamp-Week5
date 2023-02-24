//
//  GangBookViewController.swift
//  Week5
//
//  Created by Iksang Yoo on 2023/02/22.
//

import UIKit

class GangBookViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let storeList = StoreList.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "loadGangBook"), object: nil)
    }
    @objc func loadList(notification: NSNotification){
        DispatchQueue.main.async {
            self.tableView.reloadData()
            print("강북")
        }
    }
    
}

extension GangBookViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeList.gangBookStores?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? StoreCell else {
            return UITableViewCell()
        }
        cell.updateUI(stores: storeList.gangBookStores!, at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let naviVC = self.storyboard?.instantiateViewController(withIdentifier: "NaviVC") as? NaviViewController else {return}
        naviVC.store = storeList.gangBookStores![indexPath.row]
        self.present(naviVC, animated: true)
        print(storeList.gangNamStores![indexPath.row].name!)
    }
}

