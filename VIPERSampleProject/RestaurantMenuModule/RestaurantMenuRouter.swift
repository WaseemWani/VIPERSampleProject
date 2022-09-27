//
//  RestaurantMenuRouter.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 26/09/22.
//

import Foundation

class RestaurantMenuRouter: RestaurantMenuRouterProtocol {
    var entryPoint: RestaurantMenuViewProtocol?
    
    static func start(restaurantName: String) -> RestaurantMenuRouterProtocol {
        let viewController: RestaurantMenuViewController = .instantiate()
        let view: RestaurantMenuViewProtocol = viewController
        var interactor: RestaurantMenuInteractorProtocol = RestaurantMenuInteractor(restaurantName: restaurantName)
        var presenter: RestaurantMenuPresenterProtocol = RestaurantMenuPresenter()
        var router: RestaurantMenuRouterProtocol = RestaurantMenuRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        router.entryPoint = view
        
        return router
    }
}
