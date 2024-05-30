//
//  AdDetailViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/29/24.
//

import UIKit

class AdDetailViewController: UIViewController {

    @IBOutlet var adLabel: UILabel!
    
    var ad: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "광고 화면"
        adLabel.text = ad
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
