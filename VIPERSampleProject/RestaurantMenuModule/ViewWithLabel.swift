//
//  ViewWithLabel.swift
//  VIPERSampleProject
//
//  Created by Waseem Wani on 26/09/22.
//

import UIKit

class ViewWithLabel: UIView {
    @IBOutlet var titleLabel: UILabel!
    
    static func fromNib(named: String? = nil) -> ViewWithLabel {
        let name = named ?? "\(ViewWithLabel.self)"
        guard let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil) else { fatalError("missing expected nib named: \(name)")
        }
        guard let view = nib.first as? ViewWithLabel else {
            fatalError("view of type \(ViewWithLabel.self) not found in \(nib)")
        }
        return view
    }
}
