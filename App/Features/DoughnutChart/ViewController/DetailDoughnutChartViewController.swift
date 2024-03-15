//
//  DetailDoughnutChartViewController.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import UIKit

class DetailDoughnutChartViewController: UIViewController {
   
    var transactionData: [(String, Int)] = []
    var titles : String = ""
    @IBOutlet weak var tableView: UITableView!
    init() {
      super.init(nibName: "DetailDoughnutChartViewController", bundle: nil)
     
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      setNavigationBar(type: .backAndTitle(title: "Riwayat " + titles))
    }
    
    override func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
      navigationController?.popViewController(animated: true)
    }
    private func configureViews(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: HistoryChartTableViewCell.self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()

       
    }

}
extension DetailDoughnutChartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
extension DetailDoughnutChartViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return transactionData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: HistoryChartTableViewCell = tableView.dequeueReusableCell(for: indexPath)
      let transactionData = transactionData[indexPath.row]
      cell.timeLbl.text = transactionData.0
      cell.amountlabel.text = String(transactionData.1).toCurrencyFormat()
    
    return cell
  }
  
}

