//
//  TableViewController.swift
//  65-first-app
//
//  Created by Princess Max on 10.02.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//

import UIKit
class TableViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func downloadImage(withURL url: URL, forCell cell: UITableViewCell) -> TableViewCell{
        let cel = cell as! TableViewCell
        cel.tableViewCellImage.downloadedFrom(url: url)
        return cel
    }
    
}
extension TableViewController : UITableViewDataSource, UITableViewDelegate{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier)
        let url = URL(string: "http://placehold.it/375x150?text=\(indexPath.row)")
        return downloadImage(withURL: url!, forCell: cell!)
        
    }
    
    
}
