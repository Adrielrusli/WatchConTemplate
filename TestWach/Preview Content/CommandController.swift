//
//  CommandController.swift
//  TestWach
//
//  Created by Adriel Bernard Rusli on 04/05/23.
//

import Foundation
import UIKit
import WatchConnectivity

class CommandController: UITableViewController, SessionCommands, TestDataProvider{

    let commands : [Command] = [.updateAppContext, .sendMessage, .transferUserInfo]
    
    var currentCommand: Command = .updateAppContext
    var currentColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 42

    }
    
}

extension CommandController {
    
    private func newAccessoryView(cellCommand: Command, titlecolor: UIColor?) -> UIButton{
        
        let button = UIButton(type: .roundedRect)
//        button.addTarget(self, action: #selector(type(of: self)), for: .touchUpInside)
        return button
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commands.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommandCell", for: indexPath)
        
        let cellCommand = commands[indexPath.row]
        cell.textLabel?.text = cellCommand.rawValue
        
        let textColor: UIColor? = cellCommand == currentCommand ? currentColor : nil
        cell.textLabel?.textColor = textColor
        cell.detailTextLabel?.textColor = textColor
        
        cell.detailTextLabel?.text = nil
        cell.accessoryView = nil
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        currentCommand = commands[indexPath.row]
        switch currentCommand {
        case .updateAppContext: updateAppContext(appContext)
        case .sendMessage: sendMessage(message)
        case .transferUserInfo: transferUserInfo(userInfo)
        }
    }
    
   

}
