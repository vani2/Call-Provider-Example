//
//  NotificationViewController.swift
//  Notifier
//
//  Created by Ivan Vavilov on 7/13/16.
//  Copyright © 2016 Ivan Vavilov. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        
    }

}

extension NotificationViewController: UNNotificationContentExtension {
    
    func didReceive(_ notification: UNNotification) {
//        self.label?.text = notification.request.content.body
        let info = notification.request.content.userInfo
        
        
    }
    
}
