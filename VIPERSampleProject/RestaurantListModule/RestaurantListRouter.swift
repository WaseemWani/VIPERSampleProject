//
//  RestaurantListRouter.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 16/02/22.
//

import Foundation

class RestaurantListRouter: Router {
    var entryPoint: EntryPoint?
    
    static func start() -> Router {
        let viewController: RestaurantListViewController = .instantiate()
        let view: AnyView = viewController
        var interactor: Interactor = RestaurantListInteractor()
        var presenter: Presenter = RestaurantListPresenter()
        var router: Router = RestaurantListRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entryPoint = view as? EntryPoint
        
        return router
        
        
    }
    
    func routToDetailScreen(restaurantName: String) {
        let detailRouter = RestaurantDetailRouter.start(restaurantName: restaurantName)
        guard let restaurantDetailVC = detailRouter.entryPoint else { return }
        entryPoint?.navigationController?.pushViewController(restaurantDetailVC, animated: true)
    }
}
