//
//  ChatMessageCell.swift
//  Message
//
//  Created by win on 4/12/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    var messageLabelLeadingConstraint: NSLayoutConstraint!
    var messageLabelTrailingConstraint : NSLayoutConstraint!
    var chatMessage : ChatMessage?{
        didSet{
            bubleBackgroundView.backgroundColor = chatMessage!.isComming ? UIColor(displayP3Red: 104/255, green: 214/255, blue: 94/255, alpha: 1) : UIColor(displayP3Red: 230/255, green: 230/255, blue: 235/255, alpha: 1)
            messageLabel.textColor = chatMessage!.isComming ? .white : .black
            messageLabel.text = chatMessage?.text
            if (chatMessage?.isComming)! {
                messageLabelLeadingConstraint.isActive = false
                messageLabelTrailingConstraint.isActive = true
            }else {
                messageLabelLeadingConstraint.isActive = true
                messageLabelTrailingConstraint.isActive = false
            }
        }
    }
 
    let messageLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    let bubleBackgroundView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 104/255, green: 214/255, blue: 94/255, alpha: 1)
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        addSubview(bubleBackgroundView)
        addSubview(messageLabel)
        
        let constraint = [
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant : 32),
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant : -32),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            bubleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            bubleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            bubleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            bubleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(constraint)
        messageLabelLeadingConstraint =  messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        messageLabelLeadingConstraint.isActive = true
        messageLabelTrailingConstraint =  messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
        messageLabelLeadingConstraint.isActive = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
