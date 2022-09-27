//
//  RestauranMenuEntity.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 26/09/22.
//

import Foundation

struct RestaurantMenu: Codable {
    let name: String
    let menuItems: [MenuItem]
}

struct MenuItem: Codable {
    let itemName: String
}

