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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var balanceValue = -100
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let internet = AccumulatorViewModel(value: "1Гб",
                                            unit: "интернет",
                                            progress: 0.3)
        let minutes = AccumulatorViewModel(value: "275",
                                           unit: "минут",
                                           progress: 0.8)
        let messages = AccumulatorViewModel(value: "300",
                                            unit: "сообщений",
                                            progress: 1)
        
        let viewModels = [internet, minutes, messages]
        
        ViewFactory.fillStackView(restsStack,
                                  withRests: viewModels)
        
        balanceLabel.text = "\(balanceValue)₽"
    }
}



// MARK: - UNNotificationContentExtension

extension NotificationViewController: UNNotificationContentExtension {
    
    func didReceive(_ response: UNNotificationResponse,
                    completionHandler completion: (UNNotificationContentExtensionResponseOption) -> Void) {
        
        switch response.actionIdentifier {
        case "addBalance":
            addBalance()
            completion(.doNotDismiss)
        case "myPlan":
            openMainApplication()
            completion(.dismiss)
        case "showMore":
            openMainApplication()
            completion(.dismiss)
        default:
            completion(.dismiss)
        }
    }
    
    private func addBalance() {
        balanceLabel.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()

        DispatchQueue.main.after(when: .now() + 2) {
            withExtendedLifetime(self, {
                self.balanceValue += 500
                self.balanceLabel.text = "\(self.balanceValue)₽"
                self.balanceLabel.isHidden = false
                self.activityIndicator.stopAnimating()
            })
        }
    }
    
    private func openMainApplication() {
        if let url = URL(string: "callProvider://") {
            extensionContext?.open(url, completionHandler: nil)
        }
    }
    
    func didReceive(_ notification: UNNotification) {}
    
}
