//
//  CityViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/27/24.
//

import UIKit
import Kingfisher

class CityViewController: UIViewController {
    @IBOutlet var cityTableView: UITableView!
    
    let travelArr = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.delegate = self
        cityTableView.dataSource = self
        let cityNib = UINib(nibName: CellIdentifier.CityTableViewCell.description, bundle: nil)
        cityTableView.register(cityNib, forCellReuseIdentifier: CellIdentifier.CityTableViewCell.description)
        let adNib = UINib(nibName: CellIdentifier.AdTableViewCell.description, bundle: nil)
        cityTableView.register(adNib, forCellReuseIdentifier: CellIdentifier.AdTableViewCell.description)
    }
}

extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let travel = travelArr[indexPath.row]
        return travel.ad ? 80 : 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travel = travelArr[indexPath.row]
 
        if travel.ad {
            let identifier = CellIdentifier.AdTableViewCell.description
            let cell =  tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! AdTableViewCell
            cell.configureCell(travel)
            return cell
        } else {
            let identifier = CellIdentifier.CityTableViewCell.description
            let cell =  tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CityTableViewCell
            cell.configureCell(travel)
            return cell
        }
    }
}
