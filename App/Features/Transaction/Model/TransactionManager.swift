//
//  TransactionManager.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import Foundation

struct Transaction : Codable {
    let bank: String
    let transactionID: String
    let merchantName: String
    let timestamp: String
    let amount : String
}

class TransactionManager {
    
    var history: [Transaction] {
            get {
                // Mendapatkan riwayat transaksi dari UserDefaults
                if let savedData = UserDefaults.standard.data(forKey: "transactionHistoryNew") {
                    let decoder = JSONDecoder()
                    if let loadedHistory = try? decoder.decode([Transaction].self, from: savedData) {
                        return loadedHistory
                    }
                }
                return []
            }
            set {
                // Menyimpan riwayat transaksi ke UserDefaults
                let encoder = JSONEncoder()
                if let encodedData = try? encoder.encode(newValue) {
                    UserDefaults.standard.set(encodedData, forKey: "transactionHistoryNew")
                }
            }
        }
        
    func addTransaction(bank: String, transactionID: String, merchantName: String, timestamp: String, amount : String) {
            // Mendapatkan riwayat transaksi yang ada
            var currentHistory = history
            
            // Menambahkan transaksi baru ke riwayat transaksi yang ada
            let newTransaction = Transaction(bank: bank, transactionID: transactionID, merchantName: merchantName, timestamp: timestamp,amount: amount)
            currentHistory.append(newTransaction)
            
            // Menyimpan kembali riwayat transaksi keseluruhan
            history = currentHistory
        }
    
}
