//
//  SetDefaultMemberViewController.swift
//  DailyAccounter
//
//  Created by wangchi on 2019/1/29.
//  Copyright © 2019 Zhu xiaojin. All rights reserved.
//

import UIKit
import RealmSwift

class SetDefaultMemberViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    var memberArray = [Member]()
    var isDefault = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let member = memberArray[indexPath.row]
        cell.textLabel?.text = member.memberName
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 8))
        view.backgroundColor = UIColor.lightGray
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let member = memberArray[indexPath.row]
        let attributCellText = NSMutableAttributedString(string: member.memberName ?? "")
        let attributDefaultText = NSMutableAttributedString(string: "   (Default)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue])
        let combination = NSMutableAttributedString()
        combination.append(attributCellText)
        combination.append(attributDefaultText)
        cell?.textLabel?.attributedText = combination
        cell?.selectionStyle = .none
        cell?.accessoryType = .checkmark
        isDefault = true
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let member = memberArray[indexPath.row]
        cell?.textLabel?.text = member.memberName
        cell?.accessoryType = .none
        isDefault = false
    }
}
