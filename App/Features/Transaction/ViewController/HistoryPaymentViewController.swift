//
//  HistoryPaymentViewController.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import UIKit

class HistoryPaymentViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var sortedTransactions = [Transaction]()
    var transactionManager = TransactionManager()
    init() {
     
      super.init(nibName: "HistoryPaymentViewController", bundle: nil)
      hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      setNavigationBar(type: .backAndTitle(title: "History Transaksi"))
    }
    override func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
      navigationController?.popViewController(animated: true)
    }
    
    private func configureViews(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: HistoryTableViewCell.self)
         sortedTransactions = transactionManager.history.sorted { $0.timestamp > $1.timestamp }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

}
extension HistoryPaymentViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
  }
}
extension HistoryPaymentViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return sortedTransactions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: HistoryTableViewCell = tableView.dequeueReusableCell(for: indexPath)
      let transaction = sortedTransactions[indexPath.row]
      cell.bank.text = transaction.bank
      cell.trxId.text = transaction.transactionID
      cell.timeStamp.text = transaction.timestamp
      cell.amount.text = transaction.amount.toCurrencyFormat()
      cell.merch.text = transaction.merchantName
    return cell
  }
  
}
