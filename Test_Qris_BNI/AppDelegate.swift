//
//  AppDelegate.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 13/03/24.
//

import UIKit
import FirebaseCore
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private let assembler = AppAssembler()
    
    private lazy var navigator: AppNavigator = {
      assembler.resolve()
    }()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        navigator.navigateToSplashScreen(window: window)
       
        window?.makeKeyAndVisible()
       
          let initialBalance = UserDefaults.standard.integer(forKey: "balance")
          
          
          if initialBalance == 0 {
              UserDefaults.standard.set(1000000, forKey: "balance")
          }
        FirebaseApp.configure()
        
        return true
    }

 


}

