//
//  DashboardViewController.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 13/03/24.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var balanceView: UIView!
 
    @IBOutlet weak var historyImgView: UIImageView!
    @IBOutlet weak var qrImgView: UIImageView!
    @IBOutlet weak var balanceLbl: UILabel!
    @IBOutlet weak var chartView: UIView!
    
    @IBOutlet weak var promoView: UIView!
    @IBOutlet weak var lineChartView: UIView!
    var balance: Int = 0
    
    private let navigator: dashboardNavigator
    
    init(navigator: dashboardNavigator) {
      self.navigator = navigator
      super.init(nibName: "DashboardViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        addGesture()
        
    }
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      balance = UserDefaults.standard.integer(forKey: "balance")
      balanceLbl.text = String(balance).toCurrencyFormat()
    
    }
    private func configureView(){
        balanceView.addShadow()
        chartView.addShadow()
        promoView.addShadow()
        lineChartView.addShadow()
    }
    
    private func addGesture(){
        qrImgView.isUserInteractionEnabled = true
        let addPayment = UITapGestureRecognizer(target: self, action: #selector(didTapPayment(_:)))
        qrImgView.addGestureRecognizer(addPayment)
        historyImgView.isUserInteractionEnabled = true
        let history = UITapGestureRecognizer(target: self, action: #selector(didTaphistory(_:)))
        historyImgView.addGestureRecognizer(history)
        let promo = UITapGestureRecognizer(target: self, action: #selector(didTapPromo(_:)))
        promoView.addGestureRecognizer(promo)
        let chart = UITapGestureRecognizer(target: self, action: #selector(didTapChart(_:)))
        chartView.addGestureRecognizer(chart)
        let Linechart = UITapGestureRecognizer(target: self, action: #selector(didTapLineChart(_:)))
        lineChartView.addGestureRecognizer(Linechart)
        
    }

    @objc func didTapPayment(_ sender: UITapGestureRecognizer) {
        navigator.navigateToPayment(from: self)
               
    }
    @objc func didTaphistory(_ sender: UITapGestureRecognizer) {
        navigator.navigateToHistoryPayment(from: self)
       
        
    }
    @objc func didTapPromo(_ sender: UITapGestureRecognizer) {
        navigator.navigateToPromo(from: self)
       
        
    }
    @objc func didTapChart(_ sender: UITapGestureRecognizer) {
        navigator.navigateToDoughnutChart(from: self)
       
        
    }
    @objc func didTapLineChart(_ sender: UITapGestureRecognizer) {
        navigator.navigateToLineChart(from: self)
        
        
    }

}

extension UIView {
     func addShadow() {
      layer.cornerRadius = 10
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.2
      layer.shadowOffset = .zero
      layer.shadowRadius = 2
    }
}
