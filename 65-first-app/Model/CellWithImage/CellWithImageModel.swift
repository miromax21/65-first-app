//
//  CellWithImagesModel.swift
//  65-first-app
//
//  Created by Princess Max on 21.02.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//

import UIKit
class CellWithImageModel{
    let id: UUID
    var imageUrl: String
    init(image_number:Int){
        id = UUID()
        self.imageUrl = "http://placehold.it/375x150?text=\(image_number)"
    }
}
