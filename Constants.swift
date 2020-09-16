//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Андрей Останин on 25.08.2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

struct Constants {
    static let appName = "🌎ChattyChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let buttonColor = "ButtonColor"
        static let mainTheme = "MainTheme"
        static let messageColor = "MessageColor"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
