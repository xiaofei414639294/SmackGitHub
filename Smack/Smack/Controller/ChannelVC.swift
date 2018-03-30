//
//  ChannelVC.swift
//  Smack
//
//  Created by xiaofei xie on 2/19/18.
//  Copyright © 2018 xiaofei xie. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ChannelVC: UIViewController {

    //outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    @IBOutlet weak var userImg: CircleImage!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor : UIColor?
    
    let name = "test"
    let email = "test@gmail.com"

    let sendPeer1 = SendPeerService1()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        sendPeer1.delegate = self
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil) 
    }
    
    
    @IBAction func creatAccount(_ sender: Any) {
        performSegue(withIdentifier: URL_REGISTER, sender: nil)
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            
            print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
     
            sendPeer1.send(avatarName: UserDataService.instance.avatarName)
            
            print("---------------------------")
            
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "menuProfileIcon")
            userImg.backgroundColor = UIColor.clear
        }
    }
}

extension ChannelVC : SendPeerServiceDelegate1 {
    func connectedDevicesChanged(manager: SendPeerService1, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            print("Connections: \(connectedDevices)")
        }
    }
    
    func avatarChanged(manager: SendPeerService1, avatarString: String) {
        OperationQueue.main.addOperation {
            print("77777777777777777777777777777777")
            
            self.userImg.image = UIImage(named: avatarString)
        }
    }
}
