//
//  DashboardAssembler.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 13/03/24.
//

import Foundation

protocol DashboardAssembler {
  func resolve() -> dashboardNavigator
 
  func resolve() -> DashboardViewController

}
extension DashboardAssembler where Self: Assembler {
  func resolve() -> dashboardNavigator {
    return DefaultdashboardNavigator(assembler: self)
  }

  func resolve() -> DashboardViewController {
      return DashboardViewController(navigator: resolve())
  }

}
