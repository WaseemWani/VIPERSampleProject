//
//  RestaurantDetailViewController.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 16/02/22.
//

import UIKit

class RestaurantDetailViewController: UIViewController, DetailViewProtocol {
    func presentRatingViewController() {
        //
    }
    
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var yourRatingLabel: UILabel!
    
    var presenter: DetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Restaurant Details"
        self.errorLabel.isHidden = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentRatingVC))
        yourRatingLabel.isUserInteractionEnabled = true
        yourRatingLabel.addGestureRecognizer(tapGesture)
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
    
    @objc func presentRatingVC() {
        presenter?.presentRatingViewController()
    }
}

extension RestaurantDetailViewController: RatingProtocol {
    func didRateRestaurant(with rating: Int) {
         yourRatingLabel.text = "You rated it as: \(rating)"
        yourRatingLabel.textColor = .black
        yourRatingLabel.isUserInteractionEnabled = false
    }
}
