//
//  PromoViewModel.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import Foundation
import Alamofire

class PromosViewModel {
    var promos: [Promo] = []

    func fetchPromos(completion: @escaping (Error?) -> Void) {
        let url = "http://demo5853970.mockable.io/promos"
        let headers: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjc1OTE0MTUwLCJleHAiOjE2Nzg1MDYxNTB9.TcIgL5CDZYg9o8CUsSjUbbUdsYSaLutOWni88ZBs9S8"]

        AF.request(url, headers: headers).responseDecodable(of: PromoResponse.self) { response in
            switch response.result {
            case .success(let promoResponse):
                self.promos = promoResponse.promos
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}
