//
//  PromoDetailViewController.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import UIKit
import WebKit


class PromoDetailViewController: UIViewController {

  private let webUrl: String


  init(webUrl: String) {
   
    self.webUrl = webUrl
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  lazy var webView: WKWebView = {
    let webConfiguration = WKWebViewConfiguration()
    let view = WKWebView(frame: .zero, configuration: webConfiguration)
    return view
  }()

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavigationBar(type: .backAndTitle(title: "Detail Promo"))
  }
  


  override func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
      
          navigationController?.popViewController(animated: true)
      
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(webView)
    webView.frame = view.bounds
    configureView()
    loadContent()
      

  }
    

  private func loadContent() {
      
    guard let url = URL(string: webUrl) else { return }
    var urlRequest = URLRequest(url: url)
    webView.load(urlRequest)
  }
  
  private func configureView() {
    webView.translatesAutoresizingMaskIntoConstraints = false
    webView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    webView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
  }
}


