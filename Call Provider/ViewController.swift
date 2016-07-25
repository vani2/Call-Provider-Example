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

    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var container: UIStackView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let internet = AccumulatorViewModel(value: "1Гб", unit: "интернет", progress: 0.3)
        let minutes = AccumulatorViewModel(value: "275", unit: "минут", progress: 0.8)
        let messages = AccumulatorViewModel(value: "300", unit: "сообщений", progress: 1)
        
        let viewModels = [internet, minutes, messages]
        
        ViewFactory.fillStackView(container, withRests: viewModels)
        
        sendFakeNotification()
    }
    
    private func sendFakeNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "Добрый день!"
        content.subtitle = "Ваш карманный друг"
        content.body = "Ваш баланс 300 руб."
        content.categoryIdentifier = "balance"
        
        let request = UNNotificationRequest(
                identifier: "balance",
                content: content,
                trigger: UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false))
        
        UNUserNotificationCenter.current().add(request){ (error) in
            guard let error = error else { return }
            
            print(error.localizedDescription)
        }

        UNUserNotificationCenter.current().delegate = self
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
        
        print("ACTION ID = \(response.actionIdentifier)")
        
        completionHandler()
    }
    
}

