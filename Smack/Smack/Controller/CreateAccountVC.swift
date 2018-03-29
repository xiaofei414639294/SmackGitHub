//
//  CreateAccountVC.swift
//  Smack
//
//  Created by xiaofei xie on 2/23/18.
//  Copyright © 2018 xiaofei xie. All rights reserved.
//

import UIKit
import MultipeerConnectivity


class CreateAccountVC: UIViewController {

    //Outlets
     @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    
    //variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor : UIColor?
    
    let name = "test"
    let email = "test@gmail.com"

    
    let sendPeer = SendPeerService()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        sendPeer.delegate = self
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColor == nil {
                userImg.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    
    
    @IBAction func createAccntPress(_ sender: Any) {
        
        ChannelVC().sendPeer.sessionRecieve = false
        CreateAccountVC().sendPeer.sessionRecieve = false
        
        
        
        self.sendPeer.send(avatarName: self.avatarName)
        
//        AuthService.instance.createUser(name: self.name, email: self.email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
//            if success {
//                self.performSegue(withIdentifier: UNWIND, sender: nil)
//                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
//            }
//        })
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r), \(g), \(b), 1]"
        UIView.animate(withDuration: 0.2) {
            self.userImg.backgroundColor = self.bgColor
        }
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    func setupView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
}
    
    
extension CreateAccountVC : SendPeerServiceDelegate {
        func connectedDevicesChanged(manager: SendPeerService, connectedDevices: [String]) {
            OperationQueue.main.addOperation {
                print("Connections: \(connectedDevices)")
            }
        }
        
       func avatarChanged(manager: SendPeerService, avatarString: String) {
            OperationQueue.main.addOperation {
                print("############## \(avatarString)")
                print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
                
                AuthService.instance.createUser(name: self.name, email: self.email, avatarName: avatarString, avatarColor: self.avatarColor, completion: { (success) in
                    if success {
                        self.performSegue(withIdentifier: UNWIND, sender: nil)
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                    }
                })
            }
        }
}
