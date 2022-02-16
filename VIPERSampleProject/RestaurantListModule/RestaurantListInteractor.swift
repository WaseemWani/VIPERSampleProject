//
//  RestaurantListInteractor.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 16/02/22.
//

import Foundation

class RestaurantListInteractor: Interactor {
    var presenter: Presenter?
    
    func fetchRestaurants() {
        guard let path = Bundle.main.path(forResource: "Restaurants", ofType: "json")
        else { return }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
            presenter?.didFetchRestaurants(result: .success(restaurants))
        }
        catch {
            presenter?.didFetchRestaurants(result: .failure(.failed))
        }
    }
}


