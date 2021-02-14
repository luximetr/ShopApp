//
//  GetCategoriesWebAPI.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 28/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation


class GetCategoriesWebAPI: URLSessionWebAPI {
    
    // MARK: - Dependencies
    
    private let jsonConvertor = CategoryJSONConvertor()
    
    // MARK: - Get categories
    
    func getCategories(completion: @escaping Completion) {
        let request = createRequest()
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            guard let strongSelf = self else { return }
            if let data = data, let jsons = try? JSONSerialization.jsonObject(with: data) as? [JSON] {
                let categories = jsons.compactMap { strongSelf.jsonConvertor.toCategory(json: $0) }
                completion(.success(categories))
            } else {
                let failure = strongSelf.parseFailure(error: error)
                completion(.failure(failure))
            }
        }
        task.resume()
    }
    
    private func createRequest() -> URLRequest {
        return createGetURLRequest(endpoint: "/categories")
    }
    
    typealias Completion = (WebAPIResult<[Category]>) -> Void
}
