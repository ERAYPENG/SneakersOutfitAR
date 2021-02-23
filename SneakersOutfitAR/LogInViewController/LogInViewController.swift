//
//  LogInViewController.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/2/19.
//

import UIKit
import SnapKit

class LogInViewController: BaseViewController {
    let logoView: UIView = {
        let view = UIView()
        return view
    }()
    
    let accountTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    let passwordsTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}

//MARK: Private
extension LogInViewController {
    private func setupUI() {
        self.view.addSubview(accountTextField)
        self.view.addSubview(passwordsTextField)
        
        // auto layout
    }
}
