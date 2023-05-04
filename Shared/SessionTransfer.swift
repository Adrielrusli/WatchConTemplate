//
//  SessionTransfer.swift
//  TestWach
//
//  Created by Adriel Bernard Rusli on 04/05/23.
//

import Foundation
import WatchConnectivity

protocol SessionTransfer {
    var isTransffering: Bool { get }
    func cancel()
    func cancel(notifying command: Command)
}

extension SessionTransfer{
    func cancel(notifying command: Command){
        var status = Status(command: command, phrase: .canceled)
        
        
        cancel()
    }
}

