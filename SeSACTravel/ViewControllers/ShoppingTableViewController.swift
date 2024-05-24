//
//  ShoppingTableViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/24/24.
//

import UIKit

struct Shopping {
    let title: String
    var finished: Bool
    var favorited: Bool
}

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var addButton: UIButton!
    
    var shoppingList = [Shopping(title: "dwadwa", finished: false, favorited: false),
                        Shopping(title: "dwadwa", finished: false, favorited: false)]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    func setViews() {
        tableView.rowHeight = 66
        
        containerView.layer.cornerRadius = 8
        addButton.layer.cornerRadius = 8
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        cell.containerView.layer.cornerRadius = 8
        
        return cell
    }
}
