//
//  iOSDelegator.swift
//  TestWach
//
//  Created by Adriel Bernard Rusli on 04/05/23.
//
import UIKit
import Foundation
import WatchConnectivity

@UIApplicationMain
class iOSDelegator: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private lazy var sessionDelegator: SessionDelegator = {
        return SessionDelegator()
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        //trigger WCSession when app started
        assert(WCSession.isSupported(), "This sample requires Watch Connectivity support!")
        WCSession.default.delegate = sessionDelegator
        WCSession.default.activate()
        return true
    }
}
