//
//  ChatMessageViewModel.swift
//  Message
//
//  Created by win on 4/17/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import UIKit

class ChatMessageViewModel: NSObject {
    let messageFromServer = [
        ChatMessage(text: "A very common task in iOS is to provide auto sizing cells for UITableView components.", isComming: false, date : Date()),
        ChatMessage(text: "A very common task in iOS is to provide auto sizing cells for UITableView components. In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints.", isComming: true , date : Date()),
        ChatMessage(text: "A very common task in iOS is to provide auto sizing cells for UITableView components. In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints.", isComming: false, date : Date()),
        ChatMessage(text: "A very common task in iOS is to provide auto sizing cells for UITableView components. In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints.", isComming: true, date : Date()),
        ChatMessage(text: "Hi!", isComming: false, date : Date()),
        ChatMessage(text: "How are you ?", isComming: true, date : Date()),
        ChatMessage(text: "Oh", isComming: false, date : Date()),
        ChatMessage(text: "I'm fine. Thank you", isComming: true, date : Date()),
        ChatMessage(text: "Hi", isComming: true, date: Date())
    ]
    fileprivate func attemptToAssembleGroupMessage(){
        let groupMessage = Dictionary(grouping: messageFromServer) { (element) -> Date in
            return element.date
        }
        let sortKeys = groupMessage.keys.sorted()
        sortKeys.forEach { (key) in
            let values  = groupMessage[key]
            chatMessages.append(values ?? [])
        }
    }
    var chatMessages = [[ChatMessage]]()
    override init() {
        super.init()
        attemptToAssembleGroupMessage()
    }
    func getCountOfSection() -> Int {
        return chatMessages.count
    }
    func getItemCountInSection(atSection : Int) ->Int{
        return chatMessages[atSection].count
    }
    func getItemInSection(atSection : Int,withIndex : Int) -> ChatMessage{
        return chatMessages[atSection][withIndex]
    }
    func getTitleOfSection(atSection : Int)-> String{
        var dateString = String()
        if let firstMessageInSection = chatMessages[atSection].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            dateString = dateFormatter.string(from: firstMessageInSection.date)
        }
        return dateString
    }
}
