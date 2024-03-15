//
//  PromoAssembler.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import Foundation


protocol PromoAssembler {
  func resolve() -> PromoNavigator
 
  func resolve() -> PromoViewController
  func resolve(url: String) -> PromoDetailViewController

}

extension PromoAssembler where Self: Assembler {
  func resolve() -> PromoNavigator {
    return DefaultPromoNavigator(assembler: self)
  }

  func resolve() -> PromoViewController {
      return PromoViewController(navigator: resolve())
  }
    func resolve(url: String) -> PromoDetailViewController {
        return PromoDetailViewController(webUrl: url)
    }

}
