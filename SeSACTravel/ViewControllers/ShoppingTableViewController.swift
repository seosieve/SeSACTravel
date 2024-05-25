//
//  ShoppingTableViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/24/24.
//

import UIKit

struct Shopping: Codable {
    let title: String
    var finished: Bool = false
    var favorited: Bool = false
}

class UserDefaultsManager {
    private static let userDefault = UserDefaults.standard
    
    static func set<T: Codable>(_ value: T, forKey key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(value) {
            userDefault.set(encoded, forKey: key)
        }
    }
    
    static func get<T: Codable>(forKey key: String, as type: T.Type) -> T? {
        if let data = userDefault.data(forKey: key) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(type, from: data) {
                return decoded
            }
        }
        return nil
    }
}

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet var shoppingTextField: UITextField!
    @IBOutlet var containerView: UIView!
    @IBOutlet var addButton: UIButton!
    
    var shoppingList = [Shopping]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setShoppingList()
        setViews()
        print(shoppingList)
    }
    
    func setShoppingList() {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            if key.hasPrefix("shopping_") {
                if let shopping = UserDefaultsManager.get(forKey: key, as: Shopping.self) {
                    shoppingList.append(Shopping(title: shopping.title, finished: shopping.finished, favorited: shopping.favorited))
                }
            }
        }
        shoppingList.sort{$0.title < $1.title}
    }
    
    func setViews() {
        tableView.rowHeight = 66
        
        containerView.layer.cornerRadius = 8
        addButton.layer.cornerRadius = 8
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let text = shoppingTextField.text ?? ""
        
        if !text.isEmpty {
            let shopping = Shopping(title: text)
            UserDefaultsManager.set(shopping, forKey: "shopping_\(text)")
            shoppingList.append(shopping)
            shoppingTextField.text = ""
        }
        
        tableView.reloadData()
    }
}

//MARK: - TableView
extension ShoppingTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let shopping = shoppingList[indexPath.row]
        let identifier = CellIdentifier.shoppingTableViewCell.description
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ShoppingTableViewCell
        cell.containerView.layer.cornerRadius = 8
        cell.titleLable.text = shopping.title
        
        cell.checkButton.tag = indexPath.row
        let checkButtonName = shopping.finished ? "checkmark.square.fill" : "checkmark.square"
        cell.checkButton.setImage(UIImage(systemName: checkButtonName), for: .normal)
        cell.checkButton.addTarget(self, action: #selector(checkButtonPressed), for: .touchUpInside)
        
        cell.favoredButton.tag = indexPath.row
        let favoredButtonName = shopping.favorited ? "star.fill" : "star"
        cell.favoredButton.setImage(UIImage(systemName: favoredButtonName), for: .normal)
        cell.favoredButton.addTarget(self, action: #selector(favoredButtonPressed), for: .touchUpInside)
        
        return cell
    }
    
    @objc func checkButtonPressed(_ sender: UIButton) {
        shoppingList[sender.tag].finished.toggle()
        let shopping = shoppingList[sender.tag]
        UserDefaultsManager.set(shopping, forKey: "shopping_\(shopping.title)")
        tableView.reloadRows(at: [[0,sender.tag]], with: .automatic)
        print(shoppingList)
    }
    
    @objc func favoredButtonPressed(_ sender: UIButton) {
        shoppingList[sender.tag].favorited.toggle()
        let shopping = shoppingList[sender.tag]
        UserDefaultsManager.set(shopping, forKey: "shopping_\(shopping.title)")
        tableView.reloadRows(at: [[0,sender.tag]], with: .automatic)
    }
}
