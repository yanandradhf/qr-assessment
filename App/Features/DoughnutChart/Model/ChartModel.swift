//
//  ChartModel.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import Foundation

struct TransactionChart: Codable {
    let trx_date: String
    let nominal: Int
}

struct DonutChartDataItem: Codable {
    let label: String
    let percentage: String
    let data: [TransactionChart]
}

struct ChartData: Codable {
    let type: String
    let data: [DonutChartDataItem]
}
