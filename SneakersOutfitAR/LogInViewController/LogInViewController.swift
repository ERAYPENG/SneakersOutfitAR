//
//  LogInViewController.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/2/19.
//

import UIKit
import SnapKit

class LogInViewController: BaseViewController {
    private var logoView: UIView = {
        let view = UIView()
        let imageName = "ic_logo"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
        }
        return view
    }()
    
    private var accountTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 18
        return textField
    }()
    
    private var passwordsTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 18
        return textField
    }()
    
    private var logInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "ff713e")
        button.layer.cornerRadius = 20
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTouchUpInsideLogIn), for: .touchUpInside)
        return button
    }()
    
    private var forgotPasswordsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        let titleAttributes : [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor : UIColor.blue,
            NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue]
        let attributeString = NSMutableAttributedString(string: "Forgot your password?",
                                                            attributes: titleAttributes)
        button.setAttributedTitle(attributeString, for: .normal)
        button.addTarget(self, action: #selector(didTouchUpInsideForgotPasswards), for: .touchUpInside)
        return button
    }()
    
    private var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private var signUpLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "Don't have an account?"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private var signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        let titleAttributes : [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor : UIColor.blue,
            NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue]
        let attributeString = NSMutableAttributedString(string: "Sign up",
                                                            attributes: titleAttributes)
        button.setAttributedTitle(attributeString, for: .normal)
        button.addTarget(self, action: #selector(didTouchUpInsideSignUp), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}

//MARK: Private
extension LogInViewController {
    private func setupUI() {
        self.view.addSubview(self.logoView)
        self.view.addSubview(self.accountTextField)
        self.view.addSubview(self.passwordsTextField)
        self.view.addSubview(self.logInButton)
        self.view.addSubview(self.forgotPasswordsButton)
        self.view.addSubview(self.bottomLine)
        self.view.addSubview(self.signUpLabel)
        self.view.addSubview(self.signUpButton)
        
        
        // auto layout
        self.logoView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().dividedBy(2)
            make.width.height.equalTo(180)
        }
        
        self.accountTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.logoView.snp.bottom).offset(48)
            make.height.equalTo(36)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        self.passwordsTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.accountTextField.snp.bottom).offset(36)
            make.height.equalTo(36)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        self.logInButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.passwordsTextField.snp.bottom).offset(52)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(42)
        }
        
        self.forgotPasswordsButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(self.passwordsTextField.snp.bottom).offset(10)
            make.height.equalTo(10)
        }
        
        self.bottomLine.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.width.equalToSuperview()
            make.bottom.equalTo(self.view.snp.bottom).inset(72)
        }
        
        self.signUpLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.bottomLine.snp.bottom).offset(24)
            make.height.equalTo(16)
            make.centerX.equalToSuperview().offset(-30)
        }
        
        self.signUpButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.bottomLine.snp.bottom).offset(24)
            make.height.equalTo(16)
            make.leading.equalTo(self.signUpLabel.snp.trailing).offset(5)
        }
    }
}

//MARK: Event
extension LogInViewController {
    @objc private func didTouchUpInsideLogIn(sender: UIButton) {
        let arVC = UIStoryboard(name: "ApplicationFlow", bundle: nil).instantiateViewController(identifier: "Main") as! MainViewController
        self.view.window?.rootViewController = arVC
    }
    
    @objc private func didTouchUpInsideForgotPasswards(sender: UIButton) {
        
    }
    
    @objc private func didTouchUpInsideSignUp(sender: UIButton) {
        
    }
}
