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

    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var restsStack: UIStackView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let internet = AccumulatorViewModel(value: "1Гб", unit: "интернет", progress: 0.3)
        let minutes = AccumulatorViewModel(value: "275", unit: "минут", progress: 0.8)
        let messages = AccumulatorViewModel(value: "300", unit: "сообщений", progress: 1)
        
        let viewModels = [internet, minutes, messages]
        
        ViewFactory.fillStackView(restsStack, withRests: viewModels)
    }
}

extension NotificationViewController: UNNotificationContentExtension {
    
    func didReceive(_ notification: UNNotification) {
        let info = notification.request.content.userInfo
        
    }
    
}
