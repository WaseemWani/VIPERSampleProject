//
//  RatingModuleRouter.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 25/09/22.
//

import Foundation

class RatingModuleRouter: RatingRouterProtocol {
    var entryPoint: RatingViewProtocol?
    
    static func start() -> RatingRouterProtocol {
        let viewController: RatingViewController = .instantiate()
        let view: RatingViewProtocol = viewController
        let interactor: RatingInteractorProtocol = RatingModuleInteractor()
        var presenter: RatingPresenterProtocol = RatingModulePresenter()
        var router: RatingRouterProtocol = RatingModuleRouter()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        router.entryPoint = view
        
        return router
    }
    
    
}
