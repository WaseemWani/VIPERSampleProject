//
//  RestaurantDetailViewController.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 16/02/22.
//

import UIKit

class RestaurantDetailViewController: UIViewController, DetailViewProtocol {
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var errorLabel: UILabel!
    
    var presenter: DetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Restaurant Details"
        self.errorLabel.isHidden = true
    }
    
    func update(with restaurantDetails: RestaurantDetail) {
        DispatchQueue.main.async {
            self.stackView.isHidden = false
            self.errorLabel.isHidden = true
            self.nameLabel.text = restaurantDetails.name
            self.typeLabel.text = restaurantDetails.type
            self.addressLabel.text = restaurantDetails.address
            self.ratingLabel.text = restaurantDetails.google_rating
        }
    }
    
    func update(with error: Error) {
        DispatchQueue.main.async {
            self.stackView.isHidden = true
            self.errorLabel.isHidden = false
            self.errorLabel.text =  error.localizedDescription
        }

    }
}
