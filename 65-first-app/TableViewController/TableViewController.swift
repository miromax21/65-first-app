//
//  TableViewController.swift
//  65-first-app
//
//  Created by Princess Max on 10.02.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//
import UIKit
class TableViewController : UIViewController{
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        DataCellWithImageFunctions.readDataImages ( completion: {[unowned self] in
            self.tableView.reloadData()
        })
    }
    func downloadImage(withURL url: URL, forCell cell: UITableViewCell)-> UITableViewCell {
        guard let tableViewCell = cell as? TableViewCell else {return cell}
        tableViewCell.tableViewCellImage.downloadedFrom(url: url)
        return tableViewCell
    }
}
extension TableViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return DataCellWithImageModel.cellWithImages.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as! TableViewCell
        let cellWithImageModel = DataCellWithImageModel.cellWithImages[indexPath.row]
        let url = URL(string: cellWithImageModel.imageUrl)!
        return downloadImage(withURL: url, forCell: cell)
    }
}
