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
    
    let identifier = PopularCityTableViewCell.identifier
    var selectedCityArr = CityInfo.city {
        didSet { tableView.reloadData() }
    }
    var targetText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    func setViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        tableView.rowHeight = 170
        
        searchBar.delegate = self
        searchBar.placeholder = "검색어를 입력해주세요."
    }
    
    @IBAction func controlValueChanged(_ sender: UISegmentedControl) {
        selectedCityArr = currentControl()
    }
    
    func currentControl() -> [City] {
        var resultArr = [City]()
        
        switch segmentControl.selectedSegmentIndex {
        case 1:
            resultArr = CityInfo.city.filter{ $0.domestic_travel }
        case 2:
            resultArr = CityInfo.city.filter{ !$0.domestic_travel }
        default:
            resultArr = CityInfo.city
        }
        
        return resultArr
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
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

//MARK: - UISearchBarDelegate
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
    }
}
