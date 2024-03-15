//
//  IntroductionAssembler.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 13/03/24.
//

import Foundation

protocol IntroductionAssembler {
  func resolve() -> AppNavigator
 
  func resolve() -> SplashScreenViewController

}

extension IntroductionAssembler where Self: Assembler {
  func resolve() -> AppNavigator {
    return DefaultAppNavigator(assembler: self)
  }

  func resolve() -> SplashScreenViewController {
      return SplashScreenViewController(navigator: resolve())
  }

}

