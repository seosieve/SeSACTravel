//
//  ShoppingTableViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/24/24.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet var shoppingTextField: UITextField!
    @IBOutlet var containerView: UIView!
    @IBOutlet var addButton: UIButton!
    
    var shoppingList = [Shopping]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setShoppingList()
        setViews()
    }
    
    func setShoppingList() {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            if let shopping = UserDefaultsManager.get(key: key) {
                shoppingList.append(shopping)
            }
        }
        shoppingList.sort{$0.title < $1.title}
        tableView.reloadData()
    }
    
    func setViews() {
        shoppingTextField.delegate = self
        containerView.layer.cornerRadius = 8
        addButton.layer.cornerRadius = 8
        tableView.rowHeight = 66
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        shoppingListAddAction()
    }
    
    func shoppingListAddAction() {
        guard let text = shoppingTextField.text else { return }
        if text.isEmpty { return }
        
        let shopping = Shopping(title: text)
        UserDefaultsManager.set(shopping, key: text)
        shoppingList.append(shopping)
        shoppingTextField.text = ""
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
        let identifier = ShoppingTableViewCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ShoppingTableViewCell
        cell.configureCell(shopping: shopping)
        cell.checkButton.addTarget(self, action: #selector(checkButtonPressed), for: .touchUpInside)
        cell.favoredButton.addTarget(self, action: #selector(favoredButtonPressed), for: .touchUpInside)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let remove = UIContextualAction(style: .normal, title: nil) { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            self.shoppingListDeleteAction(indexPath: indexPath)
            success(true)
        }
        remove.backgroundColor = .systemPink.withAlphaComponent(0.6)
        remove.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [remove])
    }
    
    func shoppingListDeleteAction(indexPath: IndexPath) {
        UserDefaultsManager.delete(key: shoppingList[indexPath.row].title)
        shoppingList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    @objc func checkButtonPressed(_ sender: UIButton) {
        guard let indexPath = getIndexPath(sender) else { return }
        
        shoppingList[indexPath.row].finished.toggle()
        let shopping = shoppingList[indexPath.row]
        UserDefaultsManager.set(shopping, key: shopping.title)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    @objc func favoredButtonPressed(_ sender: UIButton) {
        guard let indexPath = getIndexPath(sender) else { return }
        
        shoppingList[indexPath.row].favorited.toggle()
        let shopping = shoppingList[indexPath.row]
        UserDefaultsManager.set(shopping, key: shopping.title)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func getIndexPath(_ sender: UIButton) -> IndexPath? {
        let hitPoint = sender.convert(CGPoint.zero, to: tableView)
        guard let indexPath = tableView.indexPathForRow(at: hitPoint) else { return nil }
        return indexPath
    }
}

//MARK: - UITextFieldDelegate
extension ShoppingTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        shoppingListAddAction()
        textField.resignFirstResponder()
        return true
    }
}
