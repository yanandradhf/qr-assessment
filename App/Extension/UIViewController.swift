//
//  UIViewController.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 13/03/24.
//

import UIKit
import SnapKit
import SVProgressHUD
import MaterialComponents.MaterialBottomSheet

enum NavigationBarType {
  case hidden
  case backAndTitle(title: String?)

}
protocol NavigationBarButtonHandler {
  func leftNavigationBarButtonTapped(sender: UIBarButtonItem?)
 
}

extension UIViewController {
    private func setDefaultNavigationTheme() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .black
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font:  UIFont.systemFont(ofSize: 20, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            appearance.shadowColor = .clear
            appearance.shadowImage = UIImage()
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

            // Terapkan penampilan ke semua navigasi bar
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    private func setTransparentNavigationTheme() {
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .clear
            appearance.shadowColor = .clear
            appearance.shadowImage = UIImage()
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    func setNavigationBar(type: NavigationBarType) {
        setDefaultNavigationTheme()
        
        switch type {
        case .hidden:
            navigationController?.setNavigationBarHidden(true, animated: true)
        case .backAndTitle(let title):
            self.title = title
            navigationItem.leftBarButtonItem = createBackButton()
            navigationItem.rightBarButtonItem = nil
            
        }
    }
}

extension UIViewController: NavigationBarButtonHandler {
 
  @objc func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
      
  }
    
    
}
extension UIViewController {
    private func createBackButton() -> UIBarButtonItem {
        let backButton = UIBarButtonItem(image: UIImage(named: "backIcon"), style: .plain, target: self, action: #selector(self.leftNavigationBarButtonTapped(sender:)))
        backButton.tintColor = .black
        backButton.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
        return backButton
    }
}

extension UIViewController {
    
    func getTimeStamp() -> String {
      let now = Date()
      let formatter = DateFormatter()
      formatter.timeZone = TimeZone.current
      formatter.dateFormat = "yyyy-MM-dd HH:mm"
      let dateString = formatter.string(from: now)
      return dateString
    }
    
  var window : UIWindow {
    return UIApplication.shared.windows.first!
  }
  
  func addTapGestureToHideKeyboard() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
    @IBAction public func hideKeyboard() {
    view.endEditing(true)
  }
    
    func showAlert(title: String?, message: String, buttonTitle: String? = "OK", handler: (()->Void)? = nil) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { _ in handler?() }))
      present(alert, animated: true, completion: nil)
    }
}

extension UIViewController{
  func hideLoading(){
    SVProgressHUD.dismiss()
  }
  
  func showLoading(){
    SVProgressHUD.show()
  }
}

extension String {
    func toCurrencyFormat() -> String{
      let value = self.toDouble()
      
      let currencyFormatter = NumberFormatter()
      currencyFormatter.currencySymbol = "Rp"
      currencyFormatter.currencyDecimalSeparator = ","
      currencyFormatter.currencyGroupingSeparator = "."
      currencyFormatter.maximumFractionDigits = 2
      currencyFormatter.minimumFractionDigits = 2
      currencyFormatter.numberStyle = .currency
      
      
      let priceString = currencyFormatter.string(from: NSNumber(value: value)) ?? ("Rp 0.00")
      return priceString
    }
    func toDouble()-> Double {
      return Double(self) ?? 0.00
    }
}
