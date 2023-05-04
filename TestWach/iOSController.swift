//
//  MainView.swift
//  TestWach
//
//  Created by Adriel Bernard Rusli on 04/05/23.
//

import Foundation
import UIKit
import WatchConnectivity


class iosController: UIViewController{
    
    @IBOutlet weak var reachable: UILabel!
    @IBOutlet weak var logView: UITextView!
    
    func updateReachableStatus() {
        var isReachable = false
        
        if WCSession.default.activationState == .activated{
            isReachable = WCSession.default.isReachable
        }
        reachable.backgroundColor = isReachable ? .green : .red
    }
    
    private func log(_ message: String){
        logView.text = logView.text! + message
    }
}

