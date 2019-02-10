//
//  UITableViewCellExtentions.swift
//  65-first-app
//
//  Created by Princess Max on 10.02.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//

import UIKit
extension UITableViewCell{
    class var identifier: String{
        return String(describing: self)
    }
}
