//
//  CityDetailViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/29/24.
//

import UIKit
import Kingfisher

class CityDetailViewController: UIViewController {

    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailTitleLabel: UILabel!
    @IBOutlet var detailDescriptionLabel: UILabel!
    
    var travel: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "관광지 화면"
        setViews()
    }
    
    func setViews() {
        detailImageView.layer.masksToBounds = true
        detailImageView.layer.cornerRadius = 20
        detailImageView.contentMode = .scaleAspectFill
        if let imageString = travel?.travel_image {
            let url = URL(string: imageString)
            detailImageView.kf.setImage(with: url)
        }
        
        detailTitleLabel.text = travel?.title
        detailDescriptionLabel.text = travel?.description
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
