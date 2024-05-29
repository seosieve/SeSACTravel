//
//  TravelTableViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/25/24.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    
    let magazineArr = MagazineInfo.magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TravelTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let magazine = magazineArr[indexPath.row]
        let identifier = Identifier.travelTableViewCell.description
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TravelTableViewCell
        cell.configureCell(magazine)
        return cell
    }
}
