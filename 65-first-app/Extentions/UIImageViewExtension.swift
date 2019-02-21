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
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.center = self.center
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        self.addSubview(activityIndicator)
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) -> Void in
                guard let data = data , error == nil, let image = UIImage(data: data) else { self.image = #imageLiteral(resourceName: "loading") ; return }
                DispatchQueue.main.async { () -> Void in
                    self.image = image
                    self.alpha = 0.65
                    activityIndicator.stopAnimating()
                    UIView.animate(withDuration: 2) {
                        self.alpha = 1
                    }
                }
            }).resume()
        }
    }
}
