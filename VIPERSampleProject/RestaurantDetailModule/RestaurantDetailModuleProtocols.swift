//
//  RestaurantDetailModuleProtocols.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 16/02/22.
//

import Foundation
import UIKit

protocol DetailRouterProtocol {
    var entryPoint: DetailViewProtocol? { get set }
    static func start(restaurantName: String) -> DetailRouterProtocol
}

protocol DetailPresenterProtocol {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    func didFetchData(with result: Result<RestaurantDetail, APIError>)
}

protocol DetailViewProtocol: UIViewController {
    var presenter: DetailPresenterProtocol? { get set }
    func update(with restaurantDetails: RestaurantDetail)
    func update(with error: Error)
}


protocol DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol? { get set }
    var restaurantName: String? { get set }
    func fetchRestaurantDetails()
}
