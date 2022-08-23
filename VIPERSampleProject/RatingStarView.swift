//
//  StarView.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 12/08/22.
//

import UIKit

protocol StarRatingProtocol {
    func didTapStar(rating: Int)
}

class RatingStarView: UIView {
    @IBOutlet weak var starImageView: UIImageView!
    
    let nibName = "RatingStarView"
    var contentView: UIView?
    var delegate: StarRatingProtocol?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }

    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    @IBAction func starImageViewDidTap(_ sender: Any) {
        delegate?.didTapStar(rating: self.tag)
    }
}

class RatingController: UIStackView {
    var starsRating = 0
    var starsEmptyPicName = UIImage(systemName: "star") // change it to your empty star picture name
    var starsFilledPicName = UIImage(systemName: "star.fill") // change it to your filled star picture name
    override func draw(_ rect: CGRect) {
        let starButtons = self.subviews.filter{$0 is UIButton}
        var starTag = 1
        for button in starButtons {
            if let button = button as? UIButton{
                button.setImage(starsEmptyPicName, for: .normal)
                button.addTarget(self, action: #selector(self.pressed(sender:)), for: .touchUpInside)
                button.tag = starTag
                starTag = starTag + 1
            }
        }
    }
    
    func setStarsRating(rating: Int) {
        self.starsRating = rating
        let stackSubViews = self.subviews.filter{$0 is UIButton}
        for subView in stackSubViews {
            if let button = subView as? UIButton{
                if button.tag > starsRating {
                    button.setImage(starsEmptyPicName, for: .normal)
                } else {
                    button.setImage(starsFilledPicName, for: .normal)
                }
            }
        }
    }
    
    @objc func pressed(sender: UIButton) {
        setStarsRating(rating: sender.tag)
    }
}
