//
//  ChannelVC.swift
//  Smack
//
//  Created by xiaofei xie on 2/19/18.
//  Copyright © 2018 xiaofei xie. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    
    //outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil) 
    }
    
    
    @IBAction func creatAccount(_ sender: Any) {
        performSegue(withIdentifier: URL_REGISTER, sender: nil)
    }

}
