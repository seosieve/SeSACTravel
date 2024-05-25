//
//  ShoppingTableViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/24/24.
//

import UIKit

struct Work: Codable {
    var title: String
    var isFinished: Bool
}

class UserDefaultsManager {
    static func set<T: Codable>(_ value: T, forKey key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(value) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    static func get<T: Codable>(forKey key: String, as type: T.Type) -> T? {
        if let data = UserDefaults.standard.data(forKey: key) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(type, from: data) {
                return decoded
            }
        }
        return nil
    }
}

struct Shopping {
    let title: String
    var finished: Bool
    var favorited: Bool
}

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var addButton: UIButton!
    
    var shoppingList = [Shopping(title: "그립톡 구매하기", finished: false, favorited: false),
                        Shopping(title: "사이다 구매", finished: false, favorited: false),
                        Shopping(title: "아이패드 케이스 최저가 알아보기", finished: false, favorited: false),
                        Shopping(title: "고양이 빨래", finished: false, favorited: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    func setViews() {
        tableView.rowHeight = 66
        
        containerView.layer.cornerRadius = 8
        addButton.layer.cornerRadius = 8
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
//        let work = Work(title: "김치구이", isFinished: true)
//        UserDefaultsManager.set(work, forKey: "work1")
//        if let savedWork = UserDefaultsManager.get(forKey: "work1", as: Work.self) {
//            print(savedWork.title, savedWork.isFinished)
//        }
    }
}

//MARK: - TableView
extension ShoppingTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let shopping = shoppingList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
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
        tableView.reloadRows(at: [[0,sender.tag]], with: .automatic)
    }
    
    @objc func favoredButtonPressed(_ sender: UIButton) {
        shoppingList[sender.tag].favorited.toggle()
        tableView.reloadRows(at: [[0,sender.tag]], with: .automatic)
    }
}
