//
//  ViewController.swift
//  GroupMessageTableview
//
//  Created by apple on 05/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

struct ChatMessage {
    let text: String
    let isIncoming: Bool
    let date: Date
}

extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}
class ViewController: UITableViewController {
    
    fileprivate let cellId = "id"
    
    let chatMessages = [
        [
            ChatMessage(text: "My first message", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
            ChatMessage(text: "Please check document and replace all character with capital letters.", isIncoming: true, date: Date.dateFromCustomString(customString: "08/03/2018")),
        ],
        [
        
            ChatMessage(text: "Please check document and replace all character with capital letters. Please check document and replace all character with capital letters. Please check document and replace all character with capital letters.", isIncoming: false, date: Date.dateFromCustomString(customString: "09/17/2018")),
            ChatMessage(text: "Now big bang booom!!", isIncoming: false, date: Date.dateFromCustomString(customString: "10/15/2018")),
            ChatMessage(text: "This message appear in right side of bubble!!", isIncoming: true, date: Date.dateFromCustomString(customString: "10/15/2018"))
        ],
        [
        
            ChatMessage(text: "Third section message is here", isIncoming: true, date: Date.dateFromCustomString(customString: "10/31/2018"))
        ]
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    class DateHeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .green
            backgroundColor = UIColor(red: 62.0/255, green: 255.0/255, blue: 130.0/255, alpha: 1.0)

            textColor = .white
            textAlignment = .center
            font = UIFont.boldSystemFont(ofSize: 14)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalContentSize.width + 16, height: height)
        }
        
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let firstmessageInection = chatMessages[section].first {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: firstmessageInection.date)
            
            let label = DateHeaderLabel()
            label.text = dateString
            label.translatesAutoresizingMaskIntoConstraints = false
            
            let containerView = UIView()
            containerView.addSubview(label)
            
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
        }
        
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        return "Section: \(Date())"
//    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell

//        let chatMessage = chatMessages[indexPath.row]
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        
//        cell.messageLabel.text = chatMessage.text
        cell.chatMessage = chatMessage
//        cell.IsIncoming = indexPath.row % 2 == 0
        
        return cell
    }


}

