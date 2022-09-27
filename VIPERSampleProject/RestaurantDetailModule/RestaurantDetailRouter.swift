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
    
    func routToRatingVC() {
        let ratingRouter = RatingModuleRouter.start()
        guard let ratingViewController = ratingRouter.entryPoint as? RatingViewController else { return }
        ratingViewController.delegate = entryPoint as? RatingProtocol
        entryPoint?.present(ratingViewController, animated: true, completion: nil)
    }
    
    func routToMenuVC(restaurantName: String) {
        let menuRouter = RestaurantMenuRouter.start(restaurantName: restaurantName)
        guard let menuVC = menuRouter.entryPoint else { return }
        entryPoint?.navigationController?.pushViewController(menuVC, animated: true)
    }
}
