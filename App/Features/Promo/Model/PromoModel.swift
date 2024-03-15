//
//  PromoModel.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import Foundation


struct Promo: Codable {
    let id: Int
    let name: String
    let imageURL: String
    let detailURL: String
    
    enum CodingKeys: String, CodingKey {
          case id, name
          case imageURL = "images_url"
          case detailURL = "detail"
      }
}



struct PromoResponse: Decodable {
    let promos: [Promo]
}
