//
//  ChattingRoomViewController.swift
//  SeSACTravel
//
//  Created by 서충원 on 6/1/24.
//

import UIKit

class ChattingRoomViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var bottomView: UIView!
    @IBOutlet var textContainerView: UIView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var textViewY: NSLayoutConstraint!
    @IBOutlet var bottomViewY: NSLayoutConstraint!
    
    var chatRoom = ChatRoom(chatroomId: 0, chatroomImage: [UIImage()], chatroomName: "default")
    var placeHolder = "메시지를 입력하세요."

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        configureTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableViewScrollAnimation()
    }
    
    func setViews() {
        navigationItem.title = chatRoom.chatroomName
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = .darkGray
        textContainerView.layer.cornerRadius = 12
        textView.delegate = self
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let bubbleNib = UINib(nibName: BubbleTableViewCell.identifier, bundle: nil)
        tableView.register(bubbleNib, forCellReuseIdentifier: BubbleTableViewCell.identifier)
        let myBubbleNib = UINib(nibName: MyBubbleTableViewCell.identifier, bundle: nil)
        tableView.register(myBubbleNib, forCellReuseIdentifier: MyBubbleTableViewCell.identifier)
        tableView.rowHeight =  UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    func tableViewScrollAnimation() {
        let indexPath = IndexPath(row: chatRoom.chatList.count-1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let key = UIResponder.keyboardFrameEndUserInfoKey
        guard let keyboardFrame = notification.userInfo?[key] as? CGRect else { return }
        let safeArea = UIApplication.shared.windows.first!.safeAreaInsets.bottom
        
        UIView.animate(withDuration: 0.25) {
            self.bottomViewY.constant = keyboardFrame.height - safeArea
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.25) {
            self.bottomViewY.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func dismissKeyboard() {
        textView.endEditing(true)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ChattingRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatRoom.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chat = chatRoom.chatList[indexPath.row]
        let dayChanged = (indexPath.row != 0) && (chatRoom.chatList[indexPath.row - 1].dayDate != chat.dayDate)
        
        switch chat.user {
        case .user:
            let identifier = MyBubbleTableViewCell.identifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MyBubbleTableViewCell
            cell.configureCell(chat: chat)
            if dayChanged { cell.configureDayView(chat: chat) }
            return cell
        default:
            let identifier = BubbleTableViewCell.identifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! BubbleTableViewCell
            cell.configureCell(chat: chat)
            if dayChanged { cell.configureDayView(chat: chat) }
            return cell
        }
    }
}

extension ChattingRoomViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
    
        if estimatedSize.height > 80 {
            textView.isScrollEnabled = true
            return
        } else {
            textView.isScrollEnabled = false
            UIView.animate(withDuration: 0.25) {
                self.textViewY.constant = estimatedSize.height
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .systemGray3 {
            textView.text = ""
            textView.textColor = .systemGray
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.textColor = .systemGray3
            textView.text = placeHolder
        }
    }
}
