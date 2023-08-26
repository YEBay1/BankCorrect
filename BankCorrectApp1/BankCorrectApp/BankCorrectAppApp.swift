//
//  BankCorrectAppApp.swift
//  BankCorrectApp
//
//  Created by Yunus Emre Bayezit on 27.07.2023.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    return true
  }
}

@main
struct BankCorrectAppApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
        MainView()
      }
    }
  }
}
