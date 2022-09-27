//
//  RestaurantMenuTableViewCell.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 26/09/22.
//

import UIKit

class RestaurantMenuTableViewCell: UITableViewCell {
    
    @IBOutlet var itemHeadingLabel: UILabel!
    @IBOutlet var itemNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
    }
    
    func configure(with menu: MenuItem) {
        self.selectionStyle = .none
        itemNameLabel.text = menu.itemName
    }
}
