//
//  Store.swift
//  Week5
//
//  Created by Iksang Yoo on 2023/02/22.
//

import Foundation

class StoreList {
    static let shared = StoreList()
    
    var AllStores : [Store]? {
        didSet {
            let stores = self.AllStores!
            var appendGangNamStore = [Store]()
            var appendGangBookStore = [Store]()
            var appendGwanAkStore = [Store]()
            
            for i in 0..<stores.count {
                
                let store = stores[i]
                
                switch store.guName {
                case "강남구":
                    appendGangNamStore.append(store)
                case "강북구":
                    appendGangBookStore.append(store)
                case "관악구":
                    appendGwanAkStore.append(store)
                default: break
                    
                }
            }
            gangNamStores = appendGangNamStore
            gangBookStores = appendGangBookStore
            gwanAkStores = appendGwanAkStore
        }
    }
    var gangNamStores : [Store]?
    var gangBookStores: [Store]?
    var gwanAkStores : [Store]?
    
    private init() { }
}

struct Store {
    var name: String?
    var guName: String?
    var x, y: Double?
    var address: String?
    var telNo: String?
}

