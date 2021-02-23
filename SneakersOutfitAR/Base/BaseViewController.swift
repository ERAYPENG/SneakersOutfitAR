//
//  BaseViewController.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/2/23.
//

import UIKit

class BaseViewController: UIViewController {

    var isEnableTapEndEditing: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    public func createViewControllerFromStoryboard(name: String, identifier: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
    
    func addTapEndEditingMethod(to subview: UIView) {
        let isContain = self.view.subviews.contains(subview)
        if !isContain { return }
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(didTappedView))
        subview.addGestureRecognizer(tapGes)
    }
    
    @objc func didTappedView() {
        self.view.endEditing(true)
    }

    func showErrorAlert(error: Error?, myErrorMsg: String?, completion: (()->())? = nil) {
        
        var errorMsg: String = ""
        
        if error != nil {
            errorMsg = (error?.localizedDescription)!
        } else if myErrorMsg != nil {
            errorMsg = myErrorMsg!
        }
        
        let alertController = UIAlertController(title: "System Error", message: errorMsg, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: { (alert) in
            if let completion = completion {
                completion()
            }
        })
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func createNavigationBarButton(selector:Selector, image: UIImage?, imageInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) -> UIBarButtonItem {
        let btn1 = UIButton()
        btn1.setImage(image, for: .normal)
        btn1.imageView?.contentMode = .scaleAspectFit
        btn1.imageEdgeInsets = imageInsets
        btn1.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        btn1.addTarget(self, action: selector, for: .touchUpInside)
        let item1 = UIBarButtonItem()
        item1.customView = btn1
        return item1
    }
}
