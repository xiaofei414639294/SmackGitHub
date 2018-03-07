//
//  CreateAccountVC.swift
//  Smack
//
//  Created by xiaofei xie on 2/23/18.
//  Copyright © 2018 xiaofei xie. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //Outlets
     @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccntPress(_ sender: Any) {
        guard let email = emailTxt.text, emailTxt.text != "" else { return }
        guard let pass = passwordTxt.text, passwordTxt.text != "" else { return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                print("register user!")
            }
        }

    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
   
    
}
