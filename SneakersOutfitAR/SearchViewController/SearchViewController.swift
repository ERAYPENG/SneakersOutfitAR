//
//  SearchViewController.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/2/24.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchRecommendTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        setupUI()
        // Do any additional setup after loading the view.
    }
    

    

}

//MARK: UITableView
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchRecommendCell", for: indexPath) as? SearchBarTableViewCell else {
            return SearchBarTableViewCell(style: .subtitle, reuseIdentifier: "searchRecommendCell")
        }

        cell.config()
        tableView.separatorStyle = .none
//        cell.serarchBarRecommendLabel.text = "test"
        return cell
    }
}



//MARK: Private
extension SearchViewController {
    private func setupUI() {
        
        self.searchRecommendTableView.dataSource = self
        self.searchRecommendTableView.delegate = self
        self.searchRecommendTableView.register(SearchBarTableViewCell.self, forCellReuseIdentifier: "searchRecommendCell")
        let customTabBar = CustomTabBar()
        self.view.addSubview(customTabBar)
        
        //auto lay out
        customTabBar.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(100)
        }
    }
}
