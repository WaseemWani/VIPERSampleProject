//
//  RestaurantDetailRouter.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 16/02/22.
//

import Foundation
import UIKit

class RestaurantDetailRouter: DetailRouterProtocol {
    var entryPoint: DetailViewProtocol?
    
    static func start(restaurantName: String) -> DetailRouterProtocol {
        let viewController: RestaurantDetailViewController = .instantiate()
        let view: DetailViewProtocol = viewController
        var presenter: DetailPresenterProtocol = RestaurantDetailPresenter()
        let interactor: DetailInteractorProtocol = RestaurantDetailInteractor(presenter: presenter, restaurantName: restaurantName)
        var router: DetailRouterProtocol = RestaurantDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entryPoint = view
        
        return router
    }
    
    func present() {
        let ratingViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RatingViewController")
        entryPoint?.present(ratingViewController, animated: false, completion: nil)
    }
}
