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
        let cityNib = UINib(nibName: CityTableViewCell.identifier, bundle: nil)
        cityTableView.register(cityNib, forCellReuseIdentifier: CityTableViewCell.identifier)
        let adNib = UINib(nibName: AdTableViewCell.identifier, bundle: nil)
        cityTableView.register(adNib, forCellReuseIdentifier: AdTableViewCell.identifier)
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
            let identifier = AdTableViewCell.identifier
            let cell =  tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! AdTableViewCell
            cell.configureCell(travel)
            return cell
        } else {
            let identifier = CityTableViewCell.identifier
            let cell =  tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CityTableViewCell
            cell.configureCell(travel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let travel = travelArr[indexPath.row]
        
        if travel.ad {
            let identifier = AdDetailViewController.identifier
            let vc = storyboard?.instantiateViewController(withIdentifier: identifier) as! AdDetailViewController
            vc.ad = travel.title
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true)
        } else {
            let identifier = CityDetailViewController.identifier
            let vc = storyboard?.instantiateViewController(withIdentifier: identifier) as! CityDetailViewController
            vc.travel = travel
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
