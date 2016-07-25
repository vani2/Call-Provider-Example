//
//  ViewController.swift
//  Call Provider
//
//  Created by Ivan Vavilov on 7/13/16.
//  Copyright © 2016 Ivan Vavilov. All rights reserved.
//

import UIKit
import Foundation
import UserNotifications

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
    }
    
    @IBAction func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Добрый день!"
        content.subtitle = "Ваш карманный друг"
        content.body = "Ваш баланс 300 руб."
        content.categoryIdentifier = "balance"
        
        let request = UNNotificationRequest(
            identifier: "balance",
            content: content,
            trigger: UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false))
        
        UNUserNotificationCenter.current().add(request)
    }
}

extension ViewController: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler(.alert)
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: () -> Void) {
        
        completionHandler()
    }
    
}

