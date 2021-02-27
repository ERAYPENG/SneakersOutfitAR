//
//  SearchBarTableViewCell.swift
//  SneakersOutfitAR
//
//  Created by ERAY on 2021/2/27.
//

import UIKit

class SearchBarTableViewCell: UITableViewCell {
    private var slotView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var searchBarRecommendLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var bottomLine: UIView = {
        let line = UIView()
        line.backgroundColor = .black
        return line
    }()
    
    lazy var searchKey: String = ""
    
    override class func awakeFromNib() {
        return
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        searchKey = self.searchRecommedLabel.text ?? ""
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func config() {
        self.searchBarRecommendLabel.text = "test"
        
        
        
    }

}

//MARK: Private
extension SearchBarTableViewCell {
    private func setupUI() {
        self.contentView.addSubview(self.slotView)
        self.slotView.addSubview(self.searchBarRecommendLabel)
        self.contentView.addSubview(self.bottomLine)
        
        //auto lay out
        self.slotView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        self.searchBarRecommendLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(44)
        }
        
        self.bottomLine.snp.makeConstraints { (make) in
            make.bottom.trailing.equalToSuperview()
            make.height.equalTo(1)
            make.leading.equalToSuperview().inset(8)
        }
        
    }
}
