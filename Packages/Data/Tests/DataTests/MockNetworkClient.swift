//
//  MockNetworkClient.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import CoreNetwork
import ThmanyahAPI

class MockNetworkClient: NetworkClientProtocol {
    
    var result: Any?
    var error: Error?
    
    func send<Response: Decodable>(
        _ response: Response.Type,
        endpoint: HTTPEndpoint
    ) async throws -> Response {
        if let error = error {
            throw error
        }
        return result as! Response
    }
}
