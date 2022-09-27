//
//  RestaurantMenuProtocol.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 26/09/22.
//

import UIKit

protocol RestaurantMenuRouterProtocol {
    var entryPoint: RestaurantMenuViewProtocol? { get set }
    static func start(restaurantName: String) -> RestaurantMenuRouterProtocol
}

protocol RestaurantMenuInteractorProtocol {
    var presenter: RestaurantMenuPresenterProtocol? { get set }
    func fetchMenu()
}

protocol RestaurantMenuViewProtocol: UIViewController {
    var presenter: RestaurantMenuPresenterProtocol?  { get set }
    func update(with menu: RestaurantMenu)
    func update(with error: APIError)
}

protocol RestaurantMenuPresenterProtocol {
    var router: RestaurantMenuRouterProtocol? { get set }
    var interactor: RestaurantMenuInteractorProtocol? { get set }
    var view: RestaurantMenuViewProtocol? { get set }
    func fetchMenu()
    func update(with menu: RestaurantMenu?, error: APIError?)
}
