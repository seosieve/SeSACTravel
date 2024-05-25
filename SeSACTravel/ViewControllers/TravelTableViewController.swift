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
        setViews()
    }
    
    func setViews() {
        
    }
}

extension TravelTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let magazine = magazineArr[indexPath.row]
        let identifier = CellIdentifier.travelTableViewCell.description
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TravelTableViewCell
        cell.travelImageView.layer.masksToBounds = true
        cell.travelImageView.layer.cornerRadius = 12
        cell.travelImageView.contentMode = .scaleAspectFill
        let url = URL(string: magazine.photo_image)
        cell.travelImageView.kf.setImage(with: url)
        
        cell.travelTitleLabel.text = magazine.title
        
        cell.travelSubtitleLabel.text = magazine.subtitle
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyMMdd"
        formatter.locale = Locale(identifier: "KST")
        let date = formatter.date(from: magazine.date)!
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yy년 MM월 dd일"
        let outputDate = outputFormatter.string(from: date)
        cell.dateLabel.text = outputDate
        
        return cell
    }
}
