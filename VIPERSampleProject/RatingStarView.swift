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
