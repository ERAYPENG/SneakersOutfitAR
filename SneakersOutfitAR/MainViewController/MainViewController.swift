//
//  MainViewController.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/2/24.
//

import UIKit

class MainViewController: UITabBarController {
    @IBOutlet weak var customTabBar: customTabBar!
    
//    private let searchVC = UIStoryboard(name: "ApplicationFlow", bundle: nil).instantiateViewController(withIdentifier: "SearchVC") as! SearchViewController
//
//
//    private let arVC = UIStoryboard(name: "ApplicationFlow", bundle: nil).instantiateViewController(withIdentifier: "ARCameraVC") as! ARCameraViewController
//
//
//    private let fileStorageVC = UIStoryboard(name: "ApplicationFlow", bundle: nil).instantiateViewController(withIdentifier: "FileStorageVC") as! FileStorageMainViewController
//
//    private var controllers: Array<Any> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTabBar()
        
    }
}

//MARK: Private
extension MainViewController {
    private func loadTabBar() {
//        let navSearch = UINavigationController(rootViewController: searchVC)
//
//        let navAR = UINavigationController(rootViewController: arVC)
//
//        let navFileStorage = UINavigationController(rootViewController: fileStorageVC)
//        controllers = [searchVC, navAR, navFileStorage]
    }
}

//MARK: Tab bar delegate
extension MainViewController: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//    }
}
