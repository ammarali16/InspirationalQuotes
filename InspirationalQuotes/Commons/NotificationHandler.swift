//
//  NotificationHandler.swift
//  SchedulingApp
//
//  Created by Aqeel Ahmed on 2/27/18.
//  Copyright © 2018 Mujadidia. All rights reserved.
//

import Foundation
import UserNotifications

//typealias UserInfoStandard = [AnyHashable : Any]
//
//enum NotificationActionIndentifier {
//    public static let completeTask = "Completed"
//}
//
//enum NotificationCategory: String {
//    case task
//}
//
//
//class NotificationHandler {
//
//    public static func requestAuthorization() {
////        NotificationHandler.addActions()
//        let center = UNUserNotificationCenter.current()
//        center.requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { (granted, error) in
//            if !granted {
//                print("Not printed")
//            }
//        })
//    }
//
//    public static func addActions(){
//
//        let center = UNUserNotificationCenter.current()
//
//        let completeTask = NotificationActionIndentifier.completeTask
//        let completeTaskAction = UNNotificationAction(identifier: completeTask, title: completeTask, options: [])
//        let category = UNNotificationCategory(identifier: NotificationCategory.task.rawValue,
//                                              actions: [completeTaskAction],
//                                              intentIdentifiers: [], options: [])
//        center.setNotificationCategories([category])
//    }
//
//    public static func isAuthorized(completion: @escaping (Bool) -> ()){
//        let center = UNUserNotificationCenter.current()
//        center.getNotificationSettings { (settings) in
//            if settings.authorizationStatus == .authorized {
//                completion(true)
//            }else{
//                completion(false)
//            }
//        }
//    }
//
//
//
//    public static func createNotification(identifier: String, title: String, body: String, date: Date, userInfo: UserInfoStandard = ["":""], categoryIdentifier: String = "") {
//
//        print("identifier: \(identifier), title: \(title), body: \(body), date: \(date), userInfo: \(userInfo)")
//
//        let center = UNUserNotificationCenter.current()
//
//        let content = UNMutableNotificationContent()
//        content.title = title
//        content.body = body
//        content.sound = UNNotificationSound.default()
////        content.categoryIdentifier = categoryIdentifier
//        content.userInfo = userInfo
//
//
//        let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
//
//
//
//        let request = UNNotificationRequest(identifier: identifier,
//                                            content: content, trigger: trigger)
//        center.add(request, withCompletionHandler: { (error) in
//            if let error = error {
//                print("\(identifier) error: \(error.localizedDescription)")
//            }
//        })
//
//    }
//
//    public static func removePendingNotification(identifiers: [String]) {
//        let center = UNUserNotificationCenter.current()
//        center.removePendingNotificationRequests(withIdentifiers: identifiers)
//    }
//
//    public static func removeDeliveredNotification(identifiers: [String]) {
//        let center = UNUserNotificationCenter.current()
//        center.removeDeliveredNotifications(withIdentifiers: identifiers)
//    }
//
//    public static func removeAllPendingNotification() {
//        let center = UNUserNotificationCenter.current()
//        center.removeAllPendingNotificationRequests()
//    }
//
//    public static func removeAllDeliveredNotification() {
//        let center = UNUserNotificationCenter.current()
//        center.removeAllDeliveredNotifications()
//    }
    
//    public static func createNotification(identifier: String, title: String, body: String, date: Date, userInfo: UserInfoStandard = ["":""], categoryIdentifier: String = "") {
//
//        print("identifier: \(identifier), title: \(title), body: \(body), date: \(date), userInfo: \(userInfo)")
//
//        // Step 1: Ask for permission
//        let center = UNUserNotificationCenter.current()
//
//        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
//        }
//
//        // Step 2: Create the notification content
//        let content = UNMutableNotificationContent()
//        content.title = title
//        content.body = body
//
//        // Step 3: Create the notification trigger
//        let date = Date().addingTimeInterval(10)
//
//        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
//
//        // Step 4: Create the request
//
//        let uuidString = UUID().uuidString
//
//        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
//
//        // Step 5: Register the request
//        center.add(request) { (error) in
//            // Check the error parameter and handle any errors
//        }
//    }
//}

