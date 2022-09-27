//
//  RestaurantMenuPresenter.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 26/09/22.
//

import Foundation

class RestaurantMenuPresenter: RestaurantMenuPresenterProtocol {
    var router: RestaurantMenuRouterProtocol?
    var view: RestaurantMenuViewProtocol?
    var interactor: RestaurantMenuInteractorProtocol?
    
    func fetchMenu() {
        interactor?.fetchMenu()
    }
    
    func update(with menu: RestaurantMenu?, error: APIError?) {
        if let menu = menu {
            view?.update(with: menu)
        } else if let err = error {
            view?.update(with: err)
        }
    }
}
