//
//  Status.swift
//  TestWach
//
//  Created by Adriel Bernard Rusli on 04/05/23.
//

import Foundation
import WatchConnectivity
import UIKit

enum Command: String{
    case updateAppContext = "UpdateAppContext"
    case sendMessage = "SendMessage"
    case transferUserInfo = "TransferUserInfo"
   
}
enum Phrase: String{
    case updated = "Updated"
    case sent = "Sent"
    case received = "Received"
    case replied = "Replied"
    case transferring = "Transferring"
    case canceled = "Canceled"
    case finished = "Finished"
    case failed = "Failed"
}

struct TimedColor {
    var timeStamp: String
    var colorData: Data
    
    var color: UIColor {
        let optional = ((try? NSKeyedUnarchiver.unarchivedObject(ofClasses: [UIColor.self], from: colorData)) as Any??)
        guard let color = optional as? UIColor else {
            fatalError("Failed to unarchive a UIClor object!")
        }
        return color
    }
    var timedColor: [String: Any] {
        return [PayloadKey.timeStamp: timeStamp, PayloadKey.colorData: colorData]
    }
    
    init(_ timedColor: [String: Any]) {
        guard let timeStamp = timedColor[PayloadKey.timeStamp] as? String,
            let colorData = timedColor[PayloadKey.colorData] as? Data else {
                fatalError("Timed color dictionary doesn't have right keys!")
        }
        self.timeStamp = timeStamp
        self.colorData = colorData
    }
    
    init(_ timedColor: Data) {
        let data = ((try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(timedColor)) as Any??)
        guard let dictionary = data as? [String: Any] else {
            fatalError("Failed to unarchive a timedColor dictionary!")
        }
        self.init(dictionary)
    }
}


struct Status {
    var command: Command
    var phrase: Phrase
    var errorMessage: String?
    var timedColor: TimedColor?
    
    
    
}
