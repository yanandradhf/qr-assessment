//
//  dashboardNavigator.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 13/03/24.
//

import Foundation

import UIKit

protocol dashboardNavigator {
    
    func navigateToDashboard(window: UIWindow?)
    func navigateToPayment(from viewController : UIViewController)
    func navigateToHistoryPayment(from viewController : UIViewController)
    func navigateToPromo(from viewController : UIViewController)
    func navigateToDoughnutChart(from viewController : UIViewController)
    func navigateToLineChart(from viewController : UIViewController)

  
}


struct DefaultdashboardNavigator: dashboardNavigator {
   
   
    private let assembler: Assembler
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    
    func navigateToPayment(from viewController: UIViewController) {
        let navigator : TransactionNavigator = assembler.resolve()
        navigator.navigateToPayment(from: viewController)
    }
    
    func navigateToDashboard(window: UIWindow?) {
        let viewController: DashboardViewController = assembler.resolve()
        window?.rootViewController = UINavigationController(rootViewController: viewController)
    }
    func navigateToHistoryPayment(from viewController: UIViewController) {
        let navigator : TransactionNavigator = assembler.resolve()
        navigator.navigateToHistoryPayment(from: viewController)
    }
    func navigateToPromo(from viewController: UIViewController) {
        let navigator : PromoNavigator = assembler.resolve()
        navigator.navigateToPromo(from: viewController)
    }
    func navigateToDoughnutChart(from viewController: UIViewController) {
        let navigator : DoughnutChartNavigator = assembler.resolve()
        navigator.navigateToDoughnutChart(from: viewController)
    }
    func navigateToLineChart(from viewController: UIViewController) {
        let navigator : DoughnutChartNavigator = assembler.resolve()
        navigator.navigateToLinetChart(from: viewController)
    }
    
    
  
    
    
}
