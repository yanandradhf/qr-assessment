//
//  HistoryTableViewCell.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import UIKit
import Reusable
class HistoryTableViewCell: UITableViewCell,NibReusable {

    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var bank: UILabel!
    @IBOutlet weak var content: UIView!
    
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var merch: UILabel!
    
    @IBOutlet weak var trxId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        content.addShadow()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
