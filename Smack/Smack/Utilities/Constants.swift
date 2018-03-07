//
//  Constants.swift
//  Smack
//
//  Created by xiaofei xie on 2/23/18.
//  Copyright © 2018 xiaofei xie. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL Constants
let BASE_URL = "https://realtimechaty.herokuapp.com/V1/"
let URL_REGISTER = "\(BASE_URL)account/register"


//Segues
let TO_LOGIN = "toLogin"
let TO_GREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
