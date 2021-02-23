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
        return view
    }()
    
    private var accountTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private var passwordsTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
}

//MARK: Private
extension LogInViewController {
    private func setUpUI() {
        self.view.addSubview(logoView)
        self.view.addSubview(accountTextField)
        self.view.addSubview(passwordsTextField)
        
        // AutoLayout
        
    }
    
}
