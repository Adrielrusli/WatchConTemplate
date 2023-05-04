//
//  TestDataProvider.swift
//  TestWach
//
//  Created by Adriel Bernard Rusli on 04/05/23.
//

import Foundation
import UIKit

struct PayloadKey {
    static let timeStamp = "timeStamp"
    static let colorData = "colorData"
    static let isCurrentComplicationInfo = "isCurrentComplicationInfo"
}

protocol TestDataProvider {
    var appContext: [String: Any] { get }
    var message: [String: Any] { get }
    var userInfo: [String: Any] { get }
}

private func timedColor() -> [String: Any] {
    let red = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
    let green = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
    let blue = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
    
    let randomColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    
    let data = try? NSKeyedArchiver.archivedData(withRootObject: randomColor, requiringSecureCoding: false)
    guard let colorData = data else { fatalError("Failed to archive a UIColor!") }

    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = .medium
    let timeString = dateFormatter.string(from: Date())
    
    return [PayloadKey.timeStamp: timeString, PayloadKey.colorData: colorData]
}

var appContext: [String: Any] {
    return timedColor()
}

var message: [String: Any]{
    return timedColor()
}

var userInfo: [String: Any] {
    return timedColor()
}
