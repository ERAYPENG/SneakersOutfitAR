//
//  CustomTabBar.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/2/25.
//

import UIKit

class CustomTabBar: UIView {
    let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_search"), for: .normal)
        return button
    }()
    
    let arCameraButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setImage(UIImage(named: "ic_arCamera"), for: .normal)
        return button
    }()
    
    let fileStorageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_fileStorage"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let color = UIColor.yellow
        let y:CGFloat = 0
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: y))
        myBezier.addQuadCurve(to: CGPoint(x: rect.width, y: y), controlPoint: CGPoint(x: rect.width / 2, y: rect.height / 3))
        myBezier.addLine(to: CGPoint(x: rect.width, y: rect.height))
        myBezier.addLine(to: CGPoint(x: 0, y: rect.height))
        myBezier.close()
        color.setFill()
        myBezier.fill()
    }
}

//MARK: Private
extension CustomTabBar {
    private func addCustomView() {
//        self.backgroundColor = .systemGroupedBackground
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.addSubview(self.arCameraButton)
        
        self.arCameraButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
        
//        self.arCameraButton.snp.updateConstraints { (make) in
//            make.width.height.equalTo(100)
//            make.center.equalToSuperview()
//        }
        
        
    }
}
