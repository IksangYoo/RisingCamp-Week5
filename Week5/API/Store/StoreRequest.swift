//
//  StoreRequest.swift
//  Week5
//
//  Created by Iksang Yoo on 2023/02/21.
//

import Foundation
import Alamofire

protocol StoreRequestProtocol {
    func retrieveStore(storeResponse: StoreResponse)
}

class StoreRequest {
    
    var delegate: StoreRequestProtocol?
    
    func getStoreData() {
        
        let url = "http://openapi.seoul.go.kr:8088/5a49784b63616e6439375659465477/json/CrtfcUpsoInfo/0/999"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        let request = AF.request(url,
                                 method: .get,
                                 headers: header)
        request.responseDecodable(of: StoreResponse.self) { response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.delegate?.retrieveStore(storeResponse: result)
                }
            case .failure(let error):
                print("Error Occured: \(error)")
            }
        }
    }
}
