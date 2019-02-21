//
//  UIImageViewExtension.swift
//  65-first-app
//
//  Created by Princess Max on 10.02.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//

import UIKit
extension UIImageView {
  
    func downloadedFrom(url:URL) {
        self.alpha = 0.65
        self.image = #imageLiteral(resourceName: "loading")
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.startAnimating()
        
        self.addSubview(activityIndicator)
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) -> Void in
                guard let data = data , error == nil, let image = UIImage(data: data) else { self.image = #imageLiteral(resourceName: "loading") ; return }
                DispatchQueue.main.async { () -> Void in
                    self.image = image
                    UIView.animate(withDuration: 1) {
                        self.alpha = 1
                    }
                }
            }).resume()
        }
    }
}
