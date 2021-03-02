//
//  SearchViewController.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/2/24.
//

import UIKit

class SearchViewController: BaseViewController {

    @IBOutlet weak var searchRecommendTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGroupedBackground
        setupUI()
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
        self.view.backgroundColor = .purple
        self.searchBar.searchBarStyle = .minimal
        for subView in self.searchBar.subviews where subView is UITextField {
            subView.frame = CGRect(x: 0, y: 0, width: subView.frame.size.width, height: 80)
        }
        self.searchRecommendTableView.backgroundColor = .systemGroupedBackground
        self.searchRecommendTableView.dataSource = self
        self.searchRecommendTableView.delegate = self
        self.searchRecommendTableView.register(SearchBarTableViewCell.self, forCellReuseIdentifier: "searchRecommendCell")
        
    }
}
