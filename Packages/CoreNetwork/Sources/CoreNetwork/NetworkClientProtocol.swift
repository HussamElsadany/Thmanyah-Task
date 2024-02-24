//
//  NetworkClientProtocol.swift
//
//
//  Created by Hussam Elsadany on 12/01/2024.
//

import Foundation

/// Protocol defining the capabilities of a network service.
public protocol NetworkClientProtocol {
    
    /// Sends a network request to the specified endpoint and decodes the response into the specified `Decodable` type.
    ///
    /// This asynchronous function sends a request to the given `endpoint` and attempts to decode the response
    /// into an instance of the `Response` type. It leverages Swift's `async/await` pattern for asynchronous flow control
    /// and throws errors for handling failure cases, such as network issues or decoding errors.
    ///
    /// - Parameters:
    ///   - response: The `Decodable` type to which the response data should be decoded. This type is provided
    ///               as a parameter to the function call, allowing for type inference at the call site.
    ///   - endpoint: An `HTTPEndpoint` instance containing the details of the network request, including
    ///               the URL, HTTP method, headers, and potentially a body.
    ///
    /// - Returns: An instance of the `Response` type, decoded from the JSON response of the network request.
    ///
    /// - Throws: An error if the request cannot be completed, if the response cannot be decoded to the specified
    ///           type, or if any other errors occur during the execution. Common errors include:
    ///           - `NetworkError.operationCancelled`: Indicates the operation was cancelled before completion.
    ///           - `DecodingError`: Signifies a failure in decoding the response into the specified `Response` type.
    ///           - `URLError`: Occurs when there's an issue with the network request itself.
    ///           - Other errors thrown by the `URLSession` or the decoding process.
    ///
    /// - Usage:
    /// ```
    /// struct MyAPIResponse: Decodable {
    ///     // Response structure
    /// }
    ///
    /// class MyNetworkService: NetworkService {
    ///     func fetchData() async {
    ///         do {
    ///             let endpoint = HTTPEndpoint(url: URL(string: "https://example.com/api/data")!, method: .get)
    ///             let response: MyAPIResponse = try await send(MyAPIResponse.self, endpoint: endpoint)
    ///             // Handle the decoded response
    ///         } catch {
    ///             // Handle errors
    ///         }
    ///     }
    /// }
    /// ```
    func send<Response: Decodable>(
        _ response: Response.Type,
        endpoint: HTTPEndpoint
    ) async throws -> Response
}
