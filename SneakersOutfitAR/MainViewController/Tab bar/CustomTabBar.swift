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
    
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_search"), for: .normal)
        button.addTarget(self, action: #selector(userDidTouchUpInsideSearch), for: .touchUpInside)
        button.addTarget(self, action: #selector(userDidTouchCancelSearch), for: .touchUpOutside)
        return button
    }()
    
    let arCameraButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setImage(UIImage(named: "ic_arCamera"), for: .normal)
//        button.addTarget(self, action: #selector(userDidTouchUpInsideButton), for: .touchUpInside)
        return button
    }()
    
    let fileStorageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_fileStorage"), for: .normal)
        button.addTarget(self, action: #selector(userDidTouchUpInsideFileStorage), for: .touchUpInside)
        button.addTarget(self, action: #selector(userDidTouchCancelFileStorage), for: .touchUpOutside)
        return button
    }()
    
    let circleView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.blue.cgColor
        view.layer.borderWidth = 5
        view.layer.cornerRadius = view.frame.size.width/2
//        view.layer.masksToBounds = true
//        view.clipsToBounds = true
        return view
    }()
    
    private var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
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
//        let y:CGFloat = 0
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: rect.height / 3))
//        myBezier.addLine(to: CGPoint(x: rect.width / 3, y: rect.height / 3))
////        myBezier.addLine(to: CGPoint(x: (rect.width / 3) * 2, y: rect.height / 3))
//        myBezier.addQuadCurve(to: CGPoint(x: (rect.width / 3) * 2, y: rect.height / 3), controlPoint: CGPoint(x: rect.width / 2, y: -(rect.height / 3)))
        myBezier.addLine(to: CGPoint(x: rect.width, y: rect.height / 3))
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
        self.backgroundColor = .clear
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.borderWidth = 5
        self.searchButton.isExclusiveTouch = true
        self.fileStorageButton.isExclusiveTouch = true
        
//        self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor.black.cgColor
        
        self.addSubview(self.bottomLine)
        self.addSubview(self.searchButton)
        self.addSubview(self.arCameraButton)
        self.addSubview(self.fileStorageButton)
        self.addSubview(self.circleView)
        
        self.bottomLine.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        
        self.searchButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.trailing.equalToSuperview().dividedBy(3)
            make.bottom.equalTo(self.bottomLine.snp.bottom)
        }
        
        self.arCameraButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
        
        self.fileStorageButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(80)
            make.trailing.equalToSuperview().inset(50)
            make.bottom.equalTo(self.bottomLine.snp.bottom)
        }
    }
    
    private func buttonAnimation(button: UIButton, type: ButtonAnimationType) {
        let buttonAnimaionUp = UIViewPropertyAnimator(duration: 0.3, curve: .linear) {
            button.transform = CGAffineTransform(scaleX: 2, y: 2)
            button.transform = CGAffineTransform(translationX: 0, y: -50)
//            button.frame.origin.y = -50
            
        }
        
        let buttonAnimaionDown = UIViewPropertyAnimator(duration: 0.3, curve: .linear) {
            button.transform = CGAffineTransform.identity
            button.transform = CGAffineTransform(translationX: 0, y: 50)
//            button.frame = button.frame.offsetBy(dx: 0, dy: 50)
        }
        switch type {
        case .start:
            buttonAnimaionUp.startAnimation()
        case .end:
            buttonAnimaionDown.startAnimation()
//            buttonAnimaionUp.isReversed = true
            
        }
    }
}

//MARK: Event
extension CustomTabBar {
    @objc private func userDidTouchUpInsideSearch(sender: UIButton) {
        self.buttonAnimation(button: sender, type: .start)
        self.buttonAnimation(button: self.fileStorageButton, type: .end)
        
        
    }
    
    @objc private func userDidTouchCancelSearch(sender: UIButton) {
//        self.buttonAnimation(button: self.fileStorageButton, type: .end)
    }
    
    @objc private func userDidTouchUpInsideFileStorage(sender: UIButton) {
        self.buttonAnimation(button: sender, type: .start)
        self.buttonAnimation(button: self.searchButton, type: .end)
    }
    
    @objc private func userDidTouchCancelFileStorage(sender: UIButton) {
//        self.buttonAnimation(button: self.searchButton, type: .end)
    }
}
