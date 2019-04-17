//
//  ChatMessage.swift
//  Message
//
//  Created by win on 4/17/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation

struct ChatMessage {
    var text : String
    var isComming : Bool
    var date : Date
    init(text : String , isComming : Bool,date : Date) {
        self.text = text
        self.isComming = isComming
        self.date = date
    }
}
