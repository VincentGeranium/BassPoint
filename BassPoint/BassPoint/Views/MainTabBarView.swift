//
//  MainTabBarView.swift
//  BassPoint
//
//  Created by Kwangjun Kim on 2022/05/01.
//

import Foundation
import UIKit

class MainTabBarView: UITabBarController {
    let mapView: UIViewController = MapView()
    let shopListView: UIViewController = UIViewController()
    let profileView: UIViewController = UIViewController()
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = .systemBackground
        self.delegate = self
        self.setViewControllers([mapView,shopListView,profileView], animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupMapView()
        setupShopListView()
        setupProfileView()
    }
}

extension MainTabBarView {
    func setupMapView() {
        let mapTabBarItem = UITabBarItem(
            title: "Map",
            image: UIImage(systemName: "map"),
            selectedImage: UIImage(systemName: "map.fill")
        )
        
        mapView.tabBarItem = mapTabBarItem
    }
    
    func setupShopListView() {
        let shopListTabBarItem = UITabBarItem(
            title: "Shop",
            image: UIImage(systemName: "building"),
            selectedImage: UIImage(systemName: "building.fill")
        )
        
        shopListView.tabBarItem = shopListTabBarItem
    }
    
    func setupProfileView() {
        let profileTabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.circle"),
            selectedImage: UIImage(systemName: "person.circle.fill")
        )
        
        profileView.tabBarItem = profileTabBarItem
    }
}

extension MainTabBarView: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("\(viewController.title)")
    }
}
