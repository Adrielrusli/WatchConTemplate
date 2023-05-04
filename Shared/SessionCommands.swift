//
//  SessionCommands.swift
//  TestWach
//
//  Created by Adriel Bernard Rusli on 04/05/23.
//

import Foundation
import WatchConnectivity

protocol SessionCommands {
    func sendMessage(_ message : [String: Any])
    func transferUserInfo(_ userInfo: [String: Any])
    
}
extension SessionCommands {
    
    func updateAppContext(_ context: [String: Any]) {
        var status = Status(command: .updateAppContext, phrase: .updated)
        
        guard WCSession.default.activationState == .activated else {
            return handleSessionUnactivated(with: status)
        }
        do {
            try WCSession.default.updateApplicationContext(context)
        } catch {
            status.phrase = .failed
            status.errorMessage = error.localizedDescription
        }
        
    }
    
    func sendMessage(_ message : [String: Any] ){
        var status = Status(command: .sendMessage, phrase: .sent)
        
        guard WCSession.default.activationState == .activated else{
            return handleSessionUnactivated(with: status)
        }
        
        WCSession.default.sendMessage(message, replyHandler: { replyMessage in
            status.phrase = .replied
            
            
        }, errorHandler: { error in
            status.phrase = .failed
            
        })
        
    }
    
    func tranferUserInfo(_ userInfo: [String: Any]){
        var status = Status(command: .transferUserInfo, phrase: .transferring)
        
        guard WCSession.default.activationState == .activated else{
            return handleSessionUnactivated(with: status)
        }
    }
    
    private func handleSessionUnactivated(with status: Status) {
        var mutableStatus = status
        mutableStatus.phrase = .failed
        mutableStatus.errorMessage = "WCSession is not activated yet"
    }
    
}



