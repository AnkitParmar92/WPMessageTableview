//
//  ChatMessageCell.swift
//  GroupMessageTableview
//
//  Created by apple on 05/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {

   let messageLabel = UILabel()
   let bubbleBGView = UIView()
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    var chatMessage: ChatMessage! {
        didSet {
            
            bubbleBGView.backgroundColor = chatMessage.isIncoming ? .white : UIColor(red: 0.0/255, green: 156.0/255, blue: 83.0/255, alpha: 1.0)
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            
            messageLabel.text = chatMessage.text
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            }
            else
            {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        bubbleBGView.backgroundColor = .green
        bubbleBGView.layer.cornerRadius = 12
        bubbleBGView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bubbleBGView)
        addSubview(messageLabel)
        
//        messageLabel.backgroundColor = .green
        messageLabel.text = "Parmar Ankit K is greatest player of olympic and won the gold medal in volleyball tournament. So last year champion got 1Cr rupees."
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // set up some constraints
        let constraints = [messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
        messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
        bubbleBGView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16) ,
        bubbleBGView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
        bubbleBGView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
        bubbleBGView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)]
        
        NSLayoutConstraint.activate(constraints)
        
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        leadingConstraint.isActive = false
        
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        trailingConstraint.isActive = true
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
