//
//  AppNavigator.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 13/03/24.
//

import Foundation

import UIKit

protocol AppNavigator {

  func navigateToDashboard(window: UIWindow?)

  func navigateToSplashScreen(window: UIWindow?)
  
}
struct DefaultAppNavigator: AppNavigator {
   
    private let assembler: Assembler
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    func navigateToDashboard(window: UIWindow?) {
        let navigator : dashboardNavigator = assembler.resolve()
        navigator.navigateToDashboard(window: window)
    }
    
    func navigateToSplashScreen(window: UIWindow?) {
     
        let viewController: SplashScreenViewController = assembler.resolve()
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        //window?.makeKeyAndVisible()
    }
    
    
}
    
