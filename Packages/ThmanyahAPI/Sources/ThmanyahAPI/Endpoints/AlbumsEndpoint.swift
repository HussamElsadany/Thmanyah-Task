//
//  AlbumsEndpoint.swift
//
//
//  Created by Hussam Elsadany on 21/02/2024.
//

import Foundation
import CoreNetwork

public enum AlbumsEndpoint {
    case getAlbums(userId: Int)
}

extension AlbumsEndpoint: HTTPEndpoint {
    public var baseURL: String {
        CommonMovieService.baseURL
    }
    
    public var path: String {
        switch self {
        case .getAlbums:
            return "/albums"
        }
    }
    
    public var method: HttpMethod {
        .get
    }
    
    public var httpBody: Encodable? {
        nil
    }
    
    public var headers: [String : String]? {
        nil
    }
    
    public var queryParameters: [URLQueryItem]? {
        switch self {
        case .getAlbums(let userId):
            let quesrtyItems = URLQueryItem(name: "userId", value: String(describing: userId))
            return [quesrtyItems]
        }
    }
    
    public var timeout: TimeInterval? {
        30
    }
}
