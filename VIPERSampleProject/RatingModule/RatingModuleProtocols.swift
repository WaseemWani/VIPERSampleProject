//
//  RatingModuleProtocols.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 25/09/22.
//

import Foundation
import UIKit

protocol RatingRouterProtocol {
    var entryPoint: RatingViewProtocol? { get set }
    static func start() -> RatingRouterProtocol
}

protocol RatingViewProtocol: UIViewController {
    var presenter: RatingPresenterProtocol? { get set }
}


protocol RatingPresenterProtocol {
    var router: RatingRouterProtocol? { get set }
    var interactor: RatingInteractorProtocol? { get set }
}

protocol RatingInteractorProtocol {
    var presenter: RatingPresenterProtocol? { get set }
}
