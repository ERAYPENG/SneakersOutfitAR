//
//  TabItem.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/2/25.
//

import UIKit
enum TabItem: String, CaseIterable {
    case searches = "searches"
    case arCameras = "arCameras"
    case fileStorages = "fileStorages"

var viewController: UIViewController {
        switch self {
        case .searches:
            return SearchViewController()
        case .arCameras:
            return ARCameraViewController()
        case .fileStorages:
            return FileStorageViewController()
        }
    }
    // these can be your icons
    var icon: UIImage {
        switch self {
        case .searches:
            return UIImage(named: "ic_search")!
        case .arCameras:
            return UIImage(named: "ic_arCamera")!
        case .fileStorages:
            return UIImage(named: "ic_fileStorage")!
        }
    }
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
