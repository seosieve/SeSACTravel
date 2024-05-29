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
        self.navigationItem.backButtonTitle = ""
        cityTableView.delegate = self
        cityTableView.dataSource = self
        let cityNib = UINib(nibName: Identifier.CityTableViewCell.description, bundle: nil)
        cityTableView.register(cityNib, forCellReuseIdentifier: Identifier.CityTableViewCell.description)
        let adNib = UINib(nibName: Identifier.AdTableViewCell.description, bundle: nil)
        cityTableView.register(adNib, forCellReuseIdentifier: Identifier.AdTableViewCell.description)
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
            let identifier = Identifier.AdTableViewCell.description
            let cell =  tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! AdTableViewCell
            cell.configureCell(travel)
            return cell
        } else {
            let identifier = Identifier.CityTableViewCell.description
            let cell =  tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CityTableViewCell
            cell.configureCell(travel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let travel = travelArr[indexPath.row]
        
        if travel.ad {
            let identifier = Identifier.AdDetailViewController.description
            let vc = storyboard?.instantiateViewController(withIdentifier: identifier) as! AdDetailViewController
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true)
        } else {
            let identifier = Identifier.CityDetailViewController.description
            let vc = storyboard?.instantiateViewController(withIdentifier: identifier) as! CityDetailViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
