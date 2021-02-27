//
//  FileStorageMainViewController.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/2/24.
//

import UIKit

class FileStorageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    

    
}

//Private
extension FileStorageViewController {
    private func setupUI() {
        self.view.backgroundColor = .yellow
        let customTabBar = CustomTabBar()
        self.view.addSubview(customTabBar)
        
        //auto lay out
        customTabBar.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(100)
        }
    }
}
