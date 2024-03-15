//
//  PromoViewController.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import UIKit
import Kingfisher
class PromoViewController: UIViewController {

    
    @IBOutlet weak var collectionViewPromo: UICollectionView!
    let viewModel = PromosViewModel()
    private let navigator: PromoNavigator
     var screenWidth: CGFloat {
      get {
        if UIDevice.current.orientation.isLandscape {
          return max(UIScreen.main.bounds.size.height, UIScreen.main.bounds.size.width)
        } else {
          return min(UIScreen.main.bounds.size.height, UIScreen.main.bounds.size.width)
        }
      }
    }
    
    init(navigator: PromoNavigator) {
        self.navigator = navigator
      super.init(nibName: "PromoViewController", bundle: nil)
      hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      setNavigationBar(type: .backAndTitle(title: "Promo"))
    }
    
    override func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
      navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        fetchPromos()
      
    }
    
    private func configureView(){
        collectionViewPromo.delegate = self
        collectionViewPromo.dataSource = self
        collectionViewPromo.register(cellType: PromoCollectionViewCell.self)
    }
    
    func fetchPromos() {
            viewModel.fetchPromos { error in
                if let error = error {
                    print("Failed to fetch promos: \(error.localizedDescription)")
                } else {
                    DispatchQueue.main.async {
                        self.collectionViewPromo.reloadData()
                    }
                }
            }
        }

}
extension PromoViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let widthMenuItem = (screenWidth - 35) / 2
      let height = 155 / 92 * widthMenuItem
        
        return CGSize(width: widthMenuItem, height: height)
      }
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 5, right: 10)
      }
}
extension PromoViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.promos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : PromoCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        let promo = viewModel.promos[indexPath.row]
        cell.titleLbl.text = promo.name
        if let url = URL(string: promo.imageURL) {
            cell.promoImg.kf.setImage(with: url, placeholder: UIImage(named: "noImage"))
        } else {
           cell.promoImg.image = UIImage(named: "noImage")
        }
           
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        let promo = viewModel.promos[indexPath.row]
        navigator.navigateToDetailPromo(from: self, url: promo.detailURL)
    }
    
    
    
}
