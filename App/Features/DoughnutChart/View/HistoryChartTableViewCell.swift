//
//  HistoryChartTableViewCell.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import UIKit
import Reusable
class HistoryChartTableViewCell: UITableViewCell,NibReusable {

    @IBOutlet weak var content: UIView!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var amountlabel: UILabel!
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
