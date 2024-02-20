//
//  PlayListEndpoint.swift
//
//
//  Created by Hussam Elsadany on 21/02/2024.
//

import Foundation
import CoreNetwork

public enum PlayListEndpoint {
    case getPlayList
}

extension PlayListEndpoint: HTTPEndpoint {
    public var baseURL: String {
        CommonMovieService.baseURL
    }
    
    public var path: String {
        switch self {
        case .getPlayList:
            return "/api/playlist"
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
        return nil
    }
    
    public var timeout: TimeInterval? {
        30
    }
}
