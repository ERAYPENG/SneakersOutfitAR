//
//  CustomTabBar.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/2/25.
//

import UIKit

enum ButtonAnimationType {
    case start
    case end
}

class CustomTabBar: UIView {
    let leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
    
    let centerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
    
    let rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
    
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_search"), for: .normal)
        button.addTarget(self, action: #selector(userDidTouchUpInsideSearch), for: .touchUpInside)
        return button
    }()
    
    lazy var arCameraButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 72, height: 72))
        button.layer.cornerRadius = button.frame.width / 2
        button.layer.masksToBounds = true
        let circleLayer = drawCircleRect(X: button.frame.midX, Y: button.frame.midY, radius: 36)
        button.addSubview(circleLayer)
        button.setImage(UIImage(named: "ic_person"), for: .normal)
        button.addTarget(self, action: #selector(userDidTouchUpInsideArCamera), for: .touchUpInside)
        return button
    }()
    
    lazy var fileStorageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_fileStorage"), for: .normal)
        button.addTarget(self, action: #selector(userDidTouchUpInsideFileStorage), for: .touchUpInside)
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
        super.draw(rect)
        
    }
    
    
}


//MARK: Private
extension CustomTabBar {
    private func addCustomView() {
        self.backgroundColor = .clear
//        self.layer.borderColor = UIColor.gray.cgColor
//        self.layer.borderWidth = 5
        self.searchButton.isExclusiveTouch = true
        self.fileStorageButton.isExclusiveTouch = true
        
        self.addSubview(self.leftView)
        self.addSubview(self.centerView)
        self.addSubview(self.rightView)
        self.leftView.addSubview(self.searchButton)
        self.centerView.addSubview(self.arCameraButton)
        self.rightView.addSubview(self.fileStorageButton)
        
        
        //auto lay out
        self.leftView.snp.makeConstraints { (make) in
            make.height.equalToSuperview().dividedBy(2)
            make.width.equalToSuperview().dividedBy(3)
            make.leading.bottom.equalToSuperview()
        }
        
        self.centerView.snp.makeConstraints { (make) in
            make.height.equalToSuperview().dividedBy(2)
            make.width.equalToSuperview().dividedBy(3)
            make.center.bottom.equalToSuperview()
        }
        
        self.rightView.snp.makeConstraints { (make) in
            make.height.equalToSuperview().dividedBy(2)
            make.width.equalToSuperview().dividedBy(3)
            make.trailing.bottom.equalToSuperview()
        }
        
        
        self.searchButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(48)

        }

        self.arCameraButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.centerView.snp.top)
            make.width.height.equalTo(72)
        }

        self.fileStorageButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(48)
        }
    }
    
    private func buttonAnimation(button: UIButton, type: ButtonAnimationType) {
        let buttonAnimaionUp = UIViewPropertyAnimator(duration: 0.3, curve: .linear) {
            button.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            
        }
        
        let buttonAnimaionDown = UIViewPropertyAnimator(duration: 0.3, curve: .linear) {
            button.transform = CGAffineTransform.identity
        }
        switch type {
        case .start:
            buttonAnimaionUp.startAnimation()
        case .end:
            buttonAnimaionDown.startAnimation()
            
        }
    }
    
    private func drawCircleRect(X: CGFloat, Y: CGFloat, radius: CGFloat) -> UIView {
        let view = UIView(frame: .zero)
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: X, y: Y), radius: radius, startAngle: 0.0, endAngle: 2.0 * .pi, clockwise: false)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 3.0
        
        view.layer.addSublayer(shapeLayer)
        return view
    }
}

//MARK: Event
extension CustomTabBar {
    @objc private func userDidTouchUpInsideSearch(sender: UIButton) {
        self.buttonAnimation(button: sender, type: .start)
        self.buttonAnimation(button: self.fileStorageButton, type: .end)
        self.arCameraButton.backgroundColor = .clear
        
        let searchVC = UIStoryboard(name: "ApplicationFlow", bundle: nil).instantiateViewController(withIdentifier: "SearchVC")
        let searchVCNav = UINavigationController(rootViewController: searchVC)
        self.window?.rootViewController = searchVCNav
        
    }
    
    @objc private func userDidTouchUpInsideArCamera(sender: UIButton) {
        self.buttonAnimation(button: self.fileStorageButton, type: .end)
        self.buttonAnimation(button: self.searchButton, type: .end)
        sender.backgroundColor = .lightGray
        
        let aRCameraVC = UIStoryboard(name: "ApplicationFlow", bundle: nil).instantiateViewController(withIdentifier: "ARCameraVC")
        let aRCameraVCNav = UINavigationController(rootViewController: aRCameraVC)
        self.window?.rootViewController = aRCameraVCNav
    }

    @objc private func userDidTouchUpInsideFileStorage(sender: UIButton) {
        self.buttonAnimation(button: sender, type: .start)
        self.buttonAnimation(button: self.searchButton, type: .end)
        self.arCameraButton.backgroundColor = .clear
        
        let fileStorageVC = UIStoryboard(name: "ApplicationFlow", bundle: nil).instantiateViewController(withIdentifier: "FileStorageVC")
        let fileStorageVCNav = UINavigationController(rootViewController: fileStorageVC)
        self.window?.rootViewController = fileStorageVCNav
    }
}
