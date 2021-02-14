//
//  MakePaymentWebAPI.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class MakePaymentWebAPI: URLSessionWebAPI {
    
    // MARK: - Make payment
    
    func makePayment(
        cartItems: [CartItem],
        shippingInfo: ShippingInfo,
        paymentInfo: PaymentInfo,
        completion: @escaping Completion
    ) {
        let params = createParams(cartItems: cartItems, shippingInfo: shippingInfo, paymentInfo: paymentInfo)
        let request = createRequest(params: params)
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            guard let strongSelf = self else { return }
            if let data = data, let json = try? JSONSerialization.jsonObject(with: data) as? JSON {
                if let success = json["success"] as? Bool, success {
                    completion(.success(nil))
                } else {
                    completion(.failure(.response(WebAPIResponseError(code: .unknown, message: "Unsuccessful"))))
                }
            } else {
                let failure = strongSelf.parseFailure(error: error)
                completion(.failure(failure))
            }
        }
        task.resume()
    }
    
    // MARK: - To JSON
    
    private func createParams(
        cartItems: [CartItem],
        shippingInfo: ShippingInfo,
        paymentInfo: PaymentInfo
    ) -> [String: Any] {
        return [
            "cartItems": convertToJSONs(cartItems: cartItems),
            "shippingInfo": convertToJSON(shippingInfo: shippingInfo),
            "paymentInfo": convertToJSON(paymentInfo: paymentInfo)
        ]
    }
    
    private func convertToJSONs(cartItems: [CartItem]) -> [JSON] {
        return cartItems.map { convertToJSON(cartItem: $0) }
    }
    
    private func convertToJSON(cartItem: CartItem) -> JSON {
        return [
            "productId": cartItem.product.id,
            "amount": cartItem.amount
        ]
    }
    
    private func convertToJSON(shippingInfo: ShippingInfo) -> JSON {
        return [
            "fullName": shippingInfo.fullName,
            "address": shippingInfo.address,
            "city": shippingInfo.city,
            "zipCode": shippingInfo.zipCode,
            "country": shippingInfo.country,
            "shippingMethod": shippingInfo.shippingMethod
        ]
    }
    
    private func convertToJSON(paymentInfo: PaymentInfo) -> JSON {
        return [
            "cardNumber": paymentInfo.cardNumber,
            "expiredMonth": paymentInfo.expiredMonth,
            "expiredYear": 2000 + paymentInfo.expiredYear,
            "cvv": paymentInfo.cvv
        ]
    }
    
    // MARK: - Create request
    
    private func createRequest(params: [String: Any]) -> URLRequest {
        return createURLRequest(
            endpoint: "/makePayment",
            httpMethod: "POST",
            params: params
        )
    }
    
    typealias Completion = (WebAPIResult<Any?>) -> Void
}
