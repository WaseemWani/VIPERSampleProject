//
//  RestaurantMenuInteractor.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 26/09/22.
//

import Foundation

class RestaurantMenuInteractor: RestaurantMenuInteractorProtocol {
    var presenter: RestaurantMenuPresenterProtocol?
    var restaurantName: String
    
    init(restaurantName: String) {
        self.restaurantName = restaurantName
    }
    
    func fetchMenu() {
        guard let path = Bundle.main.path(forResource: "RestaurantMenu", ofType: "json")
        else { return }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let restaurantsMenu = try JSONDecoder().decode([RestaurantMenu].self, from: data)
            guard let selectedRestaurantMenu = restaurantsMenu.filter({ $0.name == self.restaurantName }).first else {
                presenter?.update(with: nil, error: .failed)
                return
            }
            presenter?.update(with: selectedRestaurantMenu, error: nil)
        }
        catch {
            presenter?.update(with: nil, error: .failed)
        }
    }
}
