//
//  ViewController.swift
//  Message
//
//  Created by win on 4/12/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit


class ViewController: UITableViewController {
    fileprivate let cellId = "cellId"
    var chatMessageViewModel = ChatMessageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Message"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
    }
}
extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessageViewModel.getItemCountInSection(atSection: section)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        cell.chatMessage = chatMessageViewModel.getItemInSection(atSection: indexPath.section, withIndex: indexPath.row)
        return cell
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessageViewModel.getCountOfSection()
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewOfHeaderInSection = ViewOfHeaderInSection()
        viewOfHeaderInSection.textLabel = chatMessageViewModel.getTitleOfSection(atSection: section)
        return viewOfHeaderInSection
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
