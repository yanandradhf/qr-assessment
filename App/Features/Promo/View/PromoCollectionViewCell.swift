//
//  PromoCollectionViewCell.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import UIKit
import Reusable

class PromoCollectionViewCell: UICollectionViewCell,NibReusable {
    @IBOutlet weak var promoImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var content: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        content.addShadow()
    }

}
