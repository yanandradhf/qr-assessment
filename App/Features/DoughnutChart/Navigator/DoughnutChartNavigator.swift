//
//  DoughnutChartNavigator.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import Foundation

import UIKit

protocol DoughnutChartNavigator {
  func navigateToDoughnutChart(from viewController: UIViewController)
    func navigateToDetailChart(from viewController: UIViewController, title : String , data :  [(String, Int)])
    func navigateToLinetChart(from viewController: UIViewController)
}

struct DefaultDoughnutChartNavigator: DoughnutChartNavigator {
  private let assembler: Assembler

  init(assembler: Assembler) {
    self.assembler = assembler
  }

  func navigateToDoughnutChart(from viewController: UIViewController) {
    
    let nextViewController: DoughnutChartViewController = assembler.resolve()
    viewController.navigationController?.pushViewController(nextViewController, animated: true)
      
  }
    func navigateToLinetChart(from viewController: UIViewController) {
      
      let nextViewController: LineChartViewController = assembler.resolve()
      viewController.navigationController?.pushViewController(nextViewController, animated: true)
        
    }

    func navigateToDetailChart(from viewController: UIViewController,title : String , data :  [(String, Int)]) {
      let nextViewController: DetailDoughnutChartViewController = assembler.resolve()
        nextViewController.transactionData = data
        nextViewController.titles = title
      viewController.navigationController?.pushViewController(nextViewController, animated: true)
  }
}
