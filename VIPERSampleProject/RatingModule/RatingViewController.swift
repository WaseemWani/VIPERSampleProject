//
//  RatingViewController.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 11/08/22.
//

import UIKit

protocol RatingProtocol: AnyObject {
    func didRateRestaurant(with rating: Int)
}

class RatingViewController: UIViewController, RatingViewProtocol {
    
    //MARK:- Outlets
    @IBOutlet var ratingView: UIView!
    @IBOutlet var draggingLabel: UILabel!
    @IBOutlet var ratingButton: UIButton!
    @IBOutlet var starRatingView: UIStackView!
    
    // MARK:- Variables
    var currentStarsRating: Int?
    weak var delegate: RatingProtocol?
    var presenter: RatingPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        starRatingView.subviews.forEach { view in
            if let starView = view as? RatingStarView {
                starView.delegate = self
            }
        }
    }
    
    func didTapView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        ratingButton.layer.cornerRadius = 7
        draggingLabel.layer.masksToBounds = true
        draggingLabel.layer.cornerRadius = 3
        let rectShape = CAShapeLayer()
        ratingView.layer.masksToBounds = true
        rectShape.bounds = ratingView.frame
        rectShape.position = ratingView.center
        rectShape.path = UIBezierPath(roundedRect: ratingView.bounds,  byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 16, height: 16)).cgPath
        ratingView.layer.mask = rectShape
    }
    
    @IBAction func ratingButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: { [weak self] in
            if let rating = self?.currentStarsRating {
                self?.delegate?.didRateRestaurant(with: rating)
            }
        })
    }
}

extension RatingViewController: StarRatingProtocol {
    func didTapStar(rating: Int) {
        self.currentStarsRating = rating
        let stackSubViews = starRatingView.subviews.filter{$0 is RatingStarView}
        for subView in stackSubViews {
            if let starview = subView as? RatingStarView, let rating = currentStarsRating {
                if starview.tag > rating {
                    starview.starImageView.image =  UIImage(systemName: "star")
                } else {
                    starview.starImageView.image =  UIImage(systemName: "star.fill")
                }
            }
        }
    }
}
