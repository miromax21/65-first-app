//
//  ViewController.swift
//  65-first-app
//
//  Created by Princess Max on 10.02.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func downloadImage(withURL url: URL, forCell cell: UITableViewCell) -> UITableViewCell {
       let ce = cell as! imageCell
    ce.myimage?.downloadedFrom(url: url)
    return ce
    }

}
extension ViewController:UITabBarDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let url = URL(string: "http://placehold.it/375x150?text=\(indexPath.row)")
        return downloadImage(withURL: url!, forCell: cell!)
      //  cell?.imageView?.downloadedFrom(link: "http://placehold.it/375x150?text=\(indexPath.row)")
      //  return cell!
    }
    
    
}

//extension UIImageView {
//    func downloadedFrom(url:URL) {
//        URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) -> Void in
//            guard let data = data , error == nil, let image = UIImage(data: data) else { return }
//            DispatchQueue.main.async { () -> Void in
//                self.image = image
//            }
//        }).resume()
//    }
//}
