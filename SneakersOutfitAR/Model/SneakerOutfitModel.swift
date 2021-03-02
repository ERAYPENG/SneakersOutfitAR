//
//  SneakerOutfitModel.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/3/2.
//

import Foundation
import UIKit

enum CustomTabBarButtonAnimationType {
    case start
    case end
}

enum Controllers {
    case searchVC
    case arVC
    case fileStorageVC
}

@objc protocol CustomTabBarDelegate: class {
    @objc func didTapTabBarButton(_ viewController: UIViewController)
    @objc func customTabBarDidTouchUpInside(index: Int)
}
