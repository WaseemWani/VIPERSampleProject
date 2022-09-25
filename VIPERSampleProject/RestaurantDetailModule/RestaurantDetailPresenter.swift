//
//  RestaurantDetailPresenter.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 16/02/22.
//

import Foundation
import UIKit

class RestaurantDetailPresenter: DetailPresenterProtocol {
    var view: DetailViewProtocol?
    
    var interactor: DetailInteractorProtocol? {
        didSet {
            interactor?.fetchRestaurantDetails()
        }
    }
    
    var router: DetailRouterProtocol?
    
    func didFetchData(with result: Result<RestaurantDetail, APIError>) {
        switch result {
            case .success(let restaurantDetails):
                view?.update(with: restaurantDetails)
            case .failure(let error):
                view?.update(with: error)
        }
    }
    
    func presentRatingViewController() {
        router?.routToRatingVC()
    }

}
