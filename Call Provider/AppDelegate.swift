//
//  AppDelegate.swift
//  Call Provider
//
//  Created by Ivan Vavilov on 7/13/16.
//  Copyright © 2016 Ivan Vavilov. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] (granted, error) in
            if granted {
                self?.registerCategories()
            }
        }
        
        return true
    }
    
    private func registerCategories() {
        let showMoreAction = UNNotificationAction(identifier: "showMore",
                                            title: "Подробнее",
                                            options: [])
        let addBalanceAction = UNNotificationAction(identifier: "addBalance",
                                                    title: "Пополнить на 500 ₽",
                                                    options: [])
        let myPlanAction = UNNotificationAction(identifier: "myPlan",
                                                title: "Мой тариф",
                                                options: [])
        
        let balanceCategory = UNNotificationCategory(identifier: "balance",
                                                     actions: [showMoreAction, addBalanceAction, myPlanAction],
                                                     intentIdentifiers: [],
                                                     options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([balanceCategory])
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [String : AnyObject] = [:]) -> Bool {
        return true
    }
}

