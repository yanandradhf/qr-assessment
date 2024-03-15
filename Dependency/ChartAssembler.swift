//
//  ChartAssembler.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//


import Foundation


protocol ChartAssembler {
  func resolve() -> DoughnutChartNavigator
 
  func resolve() -> DoughnutChartViewController
  func resolve() -> DetailDoughnutChartViewController
  func resolve() -> LineChartViewController

}

extension ChartAssembler where Self: Assembler {
  func resolve() -> DoughnutChartNavigator {
    return DefaultDoughnutChartNavigator(assembler: self)
  }

  func resolve() -> DoughnutChartViewController {
      return DoughnutChartViewController(navigator: resolve())
  }
    func resolve() -> DetailDoughnutChartViewController {
        return DetailDoughnutChartViewController()
    }
    func resolve() -> LineChartViewController {
        return LineChartViewController()
    }

}
