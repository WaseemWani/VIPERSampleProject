//
//  UIViewControllerExtension.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 16/02/22.
//

import Foundation

import UIKit

extension UIViewController {
    
    static func instantiate<T>() -> T {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "\(T.self)") as! T
            return viewController
    }
}
