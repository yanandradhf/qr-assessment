//
//  AppAssembler.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 13/03/24.
//

import Foundation

protocol Assembler :  IntroductionAssembler,
                      DashboardAssembler,
                      TransactionAssembler,
                      PromoAssembler,
                      ChartAssembler{}

            
class AppAssembler: Assembler {}
