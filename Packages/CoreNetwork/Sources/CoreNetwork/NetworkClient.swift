//
//  NetworkClient.swift
//
//
//  Created by Hussam Elsadany on 12/01/2024.
//

import Foundation
import Combine

public class NetworkClient {
    public let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
}

extension NetworkClient: NetworkClientProtocol {
    public func send<Response>(
        _ response: Response.Type,
        endpoint: HTTPEndpoint
    ) async throws -> Response where Response: Decodable {
        let (data, _) = try await session.data(for: endpoint.urlRequest)
        let decodedObject = try decode(data: data, type: response)
        return decodedObject
    }
}

private extension NetworkClient {
    func decode<T: Decodable>(data: Data?, type: T.Type) throws -> T {
        guard let data = data, !data.isEmpty else {
            throw NetworkError.contentEmptyData
        }
        
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw NetworkError.contentDecoding(error: error)
        }
    }
}
