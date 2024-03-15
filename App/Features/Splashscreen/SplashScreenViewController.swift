//
//  SplashScreenViewController.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 13/03/24.
//

import UIKit

class SplashScreenViewController: UIViewController {

    private let navigator: AppNavigator
    
    init(navigator: AppNavigator) {
      self.navigator = navigator
      super.init(nibName: "SplashScreenViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
      
    }
    override func viewDidLoad() {
      super.viewDidLoad()
        
     
       decideNextScreen()
    }
    
    private func decideNextScreen() {
        navigator.navigateToDashboard(window: window)
       
        
    }
    
    
}
