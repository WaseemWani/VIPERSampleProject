//
//  RestaurantDetailIeInteractor.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 16/02/22.
//

import Foundation

class RestaurantDetailInteractor: DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol?
    
    var restaurantName: String?
    
    init(presenter: DetailPresenterProtocol, restaurantName: String) {
        self.presenter = presenter
        self.restaurantName = restaurantName
    }
    
    func fetchRestaurantDetails() {
        guard let path = Bundle.main.path(forResource: "Restaurants", ofType: "json") else { return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decodedData =  try JSONDecoder().decode([RestaurantDetail].self, from: data)
            guard let restaurantDetails = decodedData.filter({ $0.name == restaurantName }).first else {
                presenter?.didFetchData(with: .failure(.failed))
                return
            }
            presenter?.didFetchData(with: .success(restaurantDetails ))
        }
        catch {
            presenter?.didFetchData(with: .failure(.failed))
        }
    }
}
