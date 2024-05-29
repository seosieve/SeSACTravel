//
//  PopularCityViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/29/24.
//

import UIKit

class PopularCityViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    let identifier = Identifier.PopularCityTableViewCell.description
    let cityArr = CityInfo.city
    lazy var selectedCityArr = cityArr
    var targetText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
        tableView.rowHeight = 170
        
        searchBar.delegate = self
        searchBar.placeholder = "검색어를 입력해주세요."
    }
    
    func currentControl() -> [City] {
        let index = segmentControl.selectedSegmentIndex
        var resultArr = [City]()
        
        switch index {
        case 1:
            resultArr = cityArr.filter{ $0.domestic_travel }
        case 2:
            resultArr = cityArr.filter{ !$0.domestic_travel }
        default:
            resultArr = cityArr
        }
        
        return resultArr
    }
    
    @IBAction func controlValueChanged(_ sender: UISegmentedControl) {
        selectedCityArr = currentControl()
        tableView.reloadData()
    }
}

extension PopularCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCityArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = selectedCityArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PopularCityTableViewCell
        cell.configureCell(city: city, targetText: targetText)
        
        return cell
    }
}

extension PopularCityViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchLogic()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchLogic()
    }
    
    func searchLogic() {
        guard var text = searchBar.text else { return }
        targetText = text
        text = text.lowercased()
        text = text.trimmingCharacters(in: .whitespaces)
        
        let resultArr = currentControl()
        
        var resultCityArr = [City]()
        
        for city in resultArr {
            let name = city.city_name.lowercased()
            let englishName = city.city_english_name.lowercased()
            let explain = city.city_explain.lowercased()
            
            if name.contains(text) || englishName.contains(text) || explain.contains(text) {
                resultCityArr.append(city)
            }
        }
        
        selectedCityArr = resultCityArr
        tableView.reloadData()
    }
}
