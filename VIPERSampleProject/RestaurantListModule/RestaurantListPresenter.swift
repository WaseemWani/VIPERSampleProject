//
//  RestaurantListPresenter.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 16/02/22.
//

import Foundation

class RestaurantListPresenter: Presenter {
    var interactor: Interactor? {
        didSet {
            interactor?.fetchRestaurants()
        }
    }
    
    var view: AnyView?
    var router: Router?

    func didFetchRestaurants(result: Result<[Restaurant], APIError>) {
        switch result {
            case .success(let restaurants):
                view?.update(with: restaurants)
            case .failure(let error):
                view?.update(with: error)
        }
    }
    
    func showRestaurantDetails(restaurantName: String) {
        router?.routToDetailScreen(restaurantName: restaurantName)
    }
}
