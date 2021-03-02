//
//  MainViewController.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/2/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
//    let searchVC = UIStoryboard(name: "ApplicationFlow", bundle: nil).instantiateViewController(withIdentifier: "SearchVC")
//
//
//    let arVC = UIStoryboard(name: "ApplicationFlow", bundle: nil).instantiateViewController(withIdentifier: "ARCameraVC")
//
//    let fileStorageVC = UIStoryboard(name: "ApplicationFlow", bundle: nil).instantiateViewController(withIdentifier: "FileStorageVC")
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let searchNav = UINavigationController(rootViewController: searchVC)
//        let arNav = UINavigationController(rootViewController: arVC)
//        let fileStorageNav = UINavigationController(rootViewController: fileStorageVC)
        self.setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        let aRCameraVC = UIStoryboard(name: "ApplicationFlow", bundle: nil).instantiateViewController(withIdentifier: "ARCameraVC")
//        let aRCameraVCNav = UINavigationController(rootViewController: aRCameraVC)
//        self.view.window?.rootViewController = aRCameraVCNav
        
        
    }
}


//MARK: Private
extension MainViewController {
    private func setupUI() {
        
        
        self.view.backgroundColor = .systemGroupedBackground
        let customTabBar = CustomTabBar()
        self.view.addSubview(customTabBar)
//        self.view.window?.addSubview(customTabBar)
        
        //auto lay out
        customTabBar.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(100)
        }
    }
}
