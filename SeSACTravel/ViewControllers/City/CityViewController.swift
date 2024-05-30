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
        let cityNib = UINib(nibName: CityTableViewCell.reuseIdentifier, bundle: nil)
        cityTableView.register(cityNib, forCellReuseIdentifier: CityTableViewCell.reuseIdentifier)
        let adNib = UINib(nibName: AdTableViewCell.reuseIdentifier, bundle: nil)
        cityTableView.register(adNib, forCellReuseIdentifier: AdTableViewCell.reuseIdentifier)
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
            let identifier = AdTableViewCell.reuseIdentifier
            let cell =  tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! AdTableViewCell
            cell.configureCell(travel)
            return cell
        } else {
            let identifier = CityTableViewCell.reuseIdentifier
            let cell =  tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CityTableViewCell
            cell.configureCell(travel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let travel = travelArr[indexPath.row]
        
        if travel.ad {
            let identifier = AdDetailViewController.reuseIdentifier
            let vc = storyboard?.instantiateViewController(withIdentifier: identifier) as! AdDetailViewController
            vc.ad = travel.title
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true)
        } else {
            let identifier = CityDetailViewController.reuseIdentifier
            let vc = storyboard?.instantiateViewController(withIdentifier: identifier) as! CityDetailViewController
            vc.travel = travel
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
