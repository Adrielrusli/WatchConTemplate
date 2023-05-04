//
//  SessionDelegator.swift
//  TestWach
//
//  Created by Adriel Bernard Rusli on 04/05/23.
//

import Foundation
import WatchConnectivity

class SessionDelegator: NSObject, WCSessionDelegate{
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print(#function)
    }
    
    
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        print(#function)
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print(#function)
        session.activate()
        
    }
    
    func sessionWatchStateDidChange(_ session: WCSession) {
        print(#function)
    }
    
    #endif
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        var status = Status(command: .sendMessage, phrase: .received)
    }
    
    
    
    
    
}
