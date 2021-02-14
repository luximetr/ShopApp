//
//  CategoryJSONConvertor.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 12.02.2021.
//  Copyright © 2021 Deskera. All rights reserved.
//

import Foundation

class CategoryJSONConvertor {
    
    func toCategory(json: JSON) -> Category? {
        guard let id = json["id"] as? CategoryIdType else { return nil }
        guard let name = json["name"] as? String else { return nil }
        
        return Category(id: id, name: name)
    }
}
