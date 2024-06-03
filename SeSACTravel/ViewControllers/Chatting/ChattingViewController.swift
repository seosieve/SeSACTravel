//
//  ChattingViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 6/1/24.
//

import UIKit

class ChattingViewController: UIViewController {

    @IBOutlet var textFieldContainerView: UIView!
    @IBOutlet var tableView: UITableView!
    
    let identifier = FriendsTableViewCell.identifier
    let chatArr = mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    func setViews() {
        textFieldContainerView.layer.cornerRadius = 12
        tableView.rowHeight = 75
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chat = chatArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! FriendsTableViewCell
        cell.configureCell(chat: chat)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: ChattingRoomViewController.identifier) as! ChattingRoomViewController
        vc.chatRoom = chatArr[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}


