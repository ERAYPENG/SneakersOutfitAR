//
//  MainViewController.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/2/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, CustomTabBarDelegate {
    let containerView: UIView = UIView()
    private var searchImage: UIImage = UIImage(named: "ic_search") ?? UIImage()
    private var arCameraImage: UIImage = UIImage(named: "ic_person") ?? UIImage()
    private var fileStorageImage: UIImage = UIImage(named: "ic_fileStorage") ?? UIImage()
    let customBar: CustomTabBar = CustomTabBar()
    lazy var containerVCs: [UIViewController] = [searchViewController,
                                            arCameraViewController,
                                            fileStorageViewController]
    //init from different story board
    let searchViewController: SearchViewController = UIStoryboard(name: "SearchVC", bundle: nil).instantiateViewController(withIdentifier: "SearchVC") as! SearchViewController
    let arCameraViewController: ARCameraViewController = UIStoryboard(name: "ARCameraVC", bundle: nil).instantiateViewController(withIdentifier: "ARCameraVC") as! ARCameraViewController
    let fileStorageViewController: FileStorageViewController = UIStoryboard(name: "FileStorageVC", bundle: nil).instantiateViewController(withIdentifier: "FileStorageVC") as! FileStorageViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customBar.delegate = self
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLayoutSubviews() {
        print(self.customBar.frame.height)
        let circle = drawCircleRect(center: CGPoint(x: self.view.frame.midX, y: (self.customBar.frame.height)), radius: 10)
        self.view.addSubview(circle)
        
        circle.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.view)
            make.width.height.equalTo(100)
        }
        
    }
}

//MARK: CustomTabBar Delegate
extension MainViewController {
    
    func customTabBarDidTouchUpInside(index: Int) {
        if index == 1 {
            //全螢幕
        } else {
            
        }
        
        for i in 0...self.containerVCs.count {
            let vc = self.containerVCs[index]
            
            vc.view.isHidden = (i == index) ? false : true
            
//            if i == index {
//                vc.view.isHidden = false
//            } else {
//                vc.view.isHidden = true
//            }
        }
    }
    
    func didTapTabBarButton(_ viewController: UIViewController) {
        let nav = UINavigationController(rootViewController: viewController)
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
}

//MARK: Private
extension MainViewController {
    private func setupUI() {
        
        let customTabBar = CustomTabBar(images: [searchImage, arCameraImage, fileStorageImage])
        self.view.addSubview(customTabBar)
        
        //auto lay out
        customTabBar.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(100)
        }
    

        
//        self.view.addSubview(containerView)
//        containerView.snp.makeConstraints { (make) in
//            make.top.leading.trailing.equalToSuperview()
//            make.bottom.equalTo(customTabBar.snp.top)
//        }
//        
//        for vc in self.containerVCs {
//            containerView.addSubview(vc.view)
//            vc.view.snp.makeConstraints({ $0.edges.equalToSuperview() })
//        }
    }
    func drawCircleRect(center: CGPoint, radius: CGFloat) -> UIView {
        let view = UIView()
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0.0, endAngle: 2.0 * .pi, clockwise: false)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 3.0
        
        view.layer.addSublayer(shapeLayer)
        return view
    }
}
