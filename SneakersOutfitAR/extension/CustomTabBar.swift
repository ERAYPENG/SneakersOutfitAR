//
//  CustomTabBar.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/2/25.
//

import UIKit

class CustomTabBar: UIView {
    weak var delegate: CustomTabBarDelegate?
    
    init(images: [UIImage]) {
        super.init(frame: .zero)
        if images.count != 3 { return }
        self.setupView(with: images)
    }
    
    private func setupView(with images: [UIImage]) {
        //fit 2 以上
        var previousButton: UIButton = UIButton()
        
        for index in 0..<images.count {
            
            let currentButton = self.createButton(with: images[index])
            currentButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            currentButton.tag = index
            
            currentButton.addTarget(self, action: #selector(createButtonTouchUpInside(_:)), for: .touchUpInside)
            
            
            self.addSubview(currentButton)
            
            if (images.count % 2 == 1) && (index == images.count/2) {
                currentButton.snp.makeConstraints { (make) in
                    make.centerY.equalTo(self.snp.top)
                    make.centerX.equalToSuperview()
                    make.width.equalTo(previousButton)
                    make.height.equalTo(previousButton)
                }
            } else if index <= images.count / 2 {
                currentButton.snp.makeConstraints { (make) in
                    make.top.equalToSuperview()
                    make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
                    make.width.equalToSuperview().dividedBy(images.count)
                    make.leading.equalToSuperview()
                }
            } else if index >= images.count / 2 {
                currentButton.snp.makeConstraints { (make) in
                    make.top.equalToSuperview()
                    make.width.equalTo(previousButton)
                    make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
                    make.leading.equalTo(previousButton.snp.trailing)
                }
            }
            previousButton = currentButton
            
        }
//        func customCenterButton() -> UIView {
//            let view = UIView()
//            return view
//        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    private func createButton(with image: UIImage) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }
    
    private func buttonAnimation(button: UIButton, type: CustomTabBarButtonAnimationType) {
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
    
    private func drawCircleRect(center: CGPoint, radius: CGFloat) -> UIView {
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

//MARK: Event
extension CustomTabBar {
    @objc private func createButtonTouchUpInside(_ sender: UIButton) {
        self.delegate?.customTabBarDidTouchUpInside(index: sender.tag)
    }
}
