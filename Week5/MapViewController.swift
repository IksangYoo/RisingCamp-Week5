//
//  MapViewController.swift
//  Week5
//
//  Created by Iksang Yoo on 2023/02/22.
//

import UIKit

class MapViewController: UIViewController,MTMapViewDelegate {
    
    let storeList = StoreList.shared
    
    @IBOutlet var containerView: UIView!
    var mapView: MTMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMapView()
    }
    
    func loadMapView() {
        var items = [MTMapPOIItem]()
        
        mapView = MTMapView(frame: self.containerView.bounds)
        mapView.delegate = self
        mapView.baseMapType = .standard
        self.containerView.addSubview(mapView)
        
        for i in 0..<storeList.AllStores!.count {
            let item = MTMapPOIItem()
            let store = storeList.AllStores![i]
            item.itemName = store.name!
            item.mapPoint = MTMapPoint(geoCoord: (MTMapPointGeo(latitude: store.y!, longitude: store.x!)))
            item.markerType = .bluePin
            items.append(item)
        }

        mapView.addPOIItems(items)
    }
}
