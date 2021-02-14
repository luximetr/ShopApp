//
//  GetProductsWebAPI.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 3/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class GetProductsWebAPI: URLSessionWebAPI {
    
    // MARK: - Dependencies
    
    private let jsonConvertor = ProductJSONConvertor()
    
    // MARK: - Get products
    func getProducts(categoryId: CategoryIdType, completion: @escaping Completion) {
        let request = createRequest(categoryId: categoryId)
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            guard let strongSelf = self else { return }
            if let data = data, let jsons = try? JSONSerialization.jsonObject(with: data) as? [JSON] {
                let products = jsons.compactMap { strongSelf.jsonConvertor.toProduct(json: $0) }
                completion(.success(products))
            } else {
                let failure = strongSelf.parseFailure(error: error)
                completion(.failure(failure))
            }
        }
        task.resume()
    }
    
    private func createRequest(categoryId: CategoryIdType) -> URLRequest {
        return createGetURLRequest(endpoint: "/categories/" + categoryId + "/products")
    }
    
    typealias Completion = (WebAPIResult<[Product]>) -> Void
}
