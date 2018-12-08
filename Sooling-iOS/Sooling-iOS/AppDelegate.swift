//
//  AppDelegate.swift
//  Sooling-iOS
//
//  Created by 여정승 on 08/12/2018.
//  Copyright © 2018 여정승. All rights reserved.
//

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GIDSignIn.sharedInstance().clientID = "923729384313-j0n61ii8n03i4ik4v6c8u3qilaup590c.apps.googleusercontent.com" 
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        KOSession.handleDidBecomeActive()
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            
            if KOSession.isKakaoAccountLoginCallback(url) {
                return  KOSession.handleOpen(url)
            }
        
        return true
            
//        return GIDSignIn.sharedInstance().handle(url as URL?,
//                                                 sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
//                                                 annotation: options[UIApplication.OpenURLOptionsKey.annotation])
    }
}
