//
//  PopularCityViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/29/24.
//

import UIKit

class PopularCityViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let identifier = Identifier.PopularCityTableViewCell.description
    let cityArr = CityInfo.city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
        tableView.rowHeight = 170
    }
}

extension PopularCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = cityArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PopularCityTableViewCell
        cell.configureCell(city: city)
        
        return cell
    }
}
