//
//  PaymentViewController.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import UIKit
import VisionKit
import RxSwift
import RxCocoa
class PaymentViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    private var bank = ""
    private var transactionID = ""
    private var merchantName = ""
    private var nominal = ""
    private let disposeBag = DisposeBag()
    @IBOutlet weak var detailView: UIView!
    var alertCtr: UIAlertController?
    @IBOutlet weak var merchantLbl: UILabel!
    @IBOutlet weak var trxIdLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var bankLbl: UILabel!
    var balance : Int = 0
    var newbalance = 0
    @IBOutlet weak var payBtn: UIButton!
    
    @IBOutlet weak var scanBtn: UIButton!
    
    var transactionManager = TransactionManager()
    
    init() {
      super.init(nibName: "PaymentViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    /// Checks is `isSupported` and `isAvailable` for `DataScannerViewController`
    var scannerAvailable: Bool {
        DataScannerViewController.isSupported &&
        DataScannerViewController.isAvailable
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard scannerAvailable == true else { return }
        configureView()
        actionBtn()
      

    }
    
    private func prepareScanner(){
        let regonizedDataTypes:Set<DataScannerViewController.RecognizedDataType> = [
          .barcode()
        ]
        
        let dataScanner = DataScannerViewController(recognizedDataTypes: regonizedDataTypes, isHighlightingEnabled: true)
        dataScanner.delegate = self
        present(dataScanner, animated: true) {
          try? dataScanner.startScanning()
        }
    }
 

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        setNavigationBar(type: .backAndTitle(title: "Payment"))
        balance = UserDefaults.standard.integer(forKey: "balance")
     
    }
    
      override func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
        navigationController?.popViewController(animated: true)
      }

    private func configureView(){
        detailView.addShadow()
        detailView.isHidden = true
        payBtn.isHidden = true
        payBtn.layer.cornerRadius = 10
        scanBtn.layer.cornerRadius = 10
    }
    
    private func actionBtn(){
        scanBtn.rx.tap
          .subscribe({ [weak self] (event) in
            guard let self = self else {return}
            prepareScanner()
          }).disposed(by: disposeBag)
        
        payBtn.rx.tap
          .subscribe({ [weak self] (event) in
            guard let self = self else {return}
            displayAlert()
          }).disposed(by: disposeBag)
    }
    
    func displayAlert() {
      let alert: UIAlertController = UIAlertController(title: "Apakah Anda yakin akan melanjutkan transaski?", message: "" , preferredStyle: .alert)
      let cancelBtn: UIAlertAction = UIAlertAction(title: "Batalkan", style: .cancel) { [weak self] _ in
          alert.dismiss(animated: true) {
            
          }
       
      }
        let okBtn: UIAlertAction = UIAlertAction(title: "Ya", style: .default) { [weak self] _ in
        alert.dismiss(animated: true) {
            self?.imgView.image = .succesIcon
            self?.payBtn.isHidden = true
            self?.detailView.isHidden = true
            self?.newbalance = (self?.balance ?? 0) - Int(self!.nominal)!
            UserDefaults.standard.set(self?.newbalance, forKey: "balance")
            self?.transactionManager.addTransaction(bank: self?.bank ?? "", transactionID: self?.transactionID ?? "", merchantName: self?.merchantName ?? "", timestamp: self?.getTimeStamp() ?? "", amount: self?.nominal ?? "")
            
        }
      }
      alert.addAction(cancelBtn)
      alert.addAction(okBtn)
      self.alertCtr = alert
      self.present(alert, animated: true, completion: nil)
    }
}

extension PaymentViewController: DataScannerViewControllerDelegate {
  
  /// User taps on the screen. Copy the text that was highlighted
  func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
    switch item {
    case .barcode(let code):
        
      guard let urlString = code.payloadStringValue else { return }
        if urlString.contains("BNI.ID12345678") {
            dataScanner.stopScanning()
            dataScanner.dismiss(animated: true)
          
            let components = urlString.components(separatedBy: ".")

            
            guard components.count == 4 else {
                print("Invalid URL format")
                return
            }
             bank = components[0]
             transactionID = components[1]
             merchantName = components[2]
             nominal = components[3]
            bankLbl.text = bank
            trxIdLbl.text = transactionID
            merchantLbl.text = merchantName
            amountLbl.text = nominal.toCurrencyFormat()
            payBtn.isHidden = false
            detailView.isHidden = false
            imgView.image = .waitIcon
        }else {
            print("QR tidak valid")
            showAlert(title: "", message: "QR code tidak valid")
        }
      
    default:
      print("Unexpected item")
    }
  }
  
}
