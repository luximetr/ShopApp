//
//  ProductJSONConvertor.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 12.02.2021.
//  Copyright © 2021 Deskera. All rights reserved.
//

import Foundation


class ProductJSONConvertor {
    
    func toProduct(json: JSON) -> Product? {
        guard let id = json["id"] as? ProductIdType else { return nil }
        guard let priceInt = json["price"] as? Int else { return nil }
        let price = Decimal(priceInt) / Decimal(100)
        let name = json["name"] as? String
        let depiction = json["description"] as? String
        let imageURLString = json["previewImageUrl"] as? String
        let imageURL = URL(string: imageURLString ?? "")
        
        return Product(
            id: id,
            imageURL: imageURL,
            name: name ?? "",
            depiction: depiction ?? "",
            price: price
        )
    }
}
