//
//  UserDataService.swift
//  Smack
//
//  Created by xiaofei xie on 3/9/18.
//  Copyright © 2018 xiaofei xie. All rights reserved.
//

import Foundation
//import MultipeerConnectivity
//
//protocol UserDataServiceDelegate {
//    
////    func connectedDevicesChanged(manager : UserDataService, connectedDevices: [String])
////    func colorChanged(manager : UserDataService, colorString: String)
//    
//}

class UserDataService  {
    static let instance = UserDataService()
//    private let UserDataServiceType = "example-user"
//
//    private let myPeerId = MCPeerID(displayName: UIDevice.current.name)
//
//    private let serviceAdvertiser : MCNearbyServiceAdvertiser
//    private let serviceBrowser : MCNearbyServiceBrowser
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, color: String, avatarName: String, email: String,
                     name: String) {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
    
}
