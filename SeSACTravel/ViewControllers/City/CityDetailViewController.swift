//
//  CityDetailViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/29/24.
//

import UIKit

class CityDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "관광지 화면"
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
