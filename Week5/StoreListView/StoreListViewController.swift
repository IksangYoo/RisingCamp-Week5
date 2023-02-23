//
//  StoreListViewController.swift
//  Week5
//
//  Created by Iksang Yoo on 2023/02/21.
//

import UIKit
import Tabman
import Pageboy

class StoreListViewController: TabmanViewController {
    
    @IBOutlet weak var tabView: UIView!

    private var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appendVC()
        tabBarLayout()
        self.dataSource = self
    }
    
//    func didSuccess(_ response: StoreResponse) {
//        let response = response.crtfcUpsoInfo.row
//        var stores = [Store]()
//
//        for i in 0..<response.count {
//            let store = response[i]
//            stores.append(Store(name: store.upsoNm, guName: store.cggCodeNm, x: Double(store.xCnts)!, y: Double(store.yDnts)!, address: store.rdnCodeNm, telNo: store.telNo))
//
//        }
//        storeList.AllStores = stores
//    }
}


extension StoreListViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        return 3
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "강남구")
        case 1:
            return TMBarItem(title: "강북구")
        case 2:
            return TMBarItem(title: "관악구")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
    
    func tabBarLayout() {
        let bar = TMBar.ButtonBar()
        
        //탭바 레이아웃 설정
        bar.layout.transitionStyle = .snap
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .intrinsic
        bar.layout.interButtonSpacing = 70 // 버튼 사이 간격 (화면 보면서 필요시 조절)
        
        
        //배경색
        bar.backgroundView.style = .clear
        bar.backgroundColor = .white
        
        //간격설정
        bar.layout.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        
        //버튼 글시 커스텀
        bar.buttons.customize{
            (button) in
            button.tintColor = .gray
            button.selectedFont = UIFont.systemFont(ofSize: 17, weight: .bold)
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 17)
        }
        
        //indicator
        bar.indicator.weight = .custom(value: 4)
        bar.indicator.overscrollBehavior = .none
        bar.indicator.tintColor = .black
        bar.indicator.transitionStyle = .none
        
        addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
    }
 
    func appendVC() {
        let gangNamVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GangNamVC") as! GangNamViewController
        let GangBookVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GangBookVC") as! GangBookViewController
        let  GwanAkVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GwanAkVC") as! GwanAkViewController
       
        viewControllers.append(gangNamVC)
        viewControllers.append(GangBookVC)
        viewControllers.append(GwanAkVC)
    }
}
