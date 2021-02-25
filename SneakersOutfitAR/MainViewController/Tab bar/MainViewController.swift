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
}


//MARK: Private
extension MainViewController {
    private func setupUI() {
        let customTabBar = CustomTabBar()
        self.view.addSubview(customTabBar)
        
        //auto lay out
        customTabBar.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(200)
        }
    }
}
