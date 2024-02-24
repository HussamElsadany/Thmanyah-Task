//
//  AlbumsListEndpoint.swift
//
//
//  Created by Hussam Elsadany on 21/02/2024.
//

import Foundation
import CoreNetwork

public enum AlbumsListEndpoint {
    case getUsers
    case getAlbums
    case getPhotos
}

extension AlbumsListEndpoint: HTTPEndpoint {
    public var baseURL: String {
        CommonMovieService.baseURL
    }
    
    public var path: String {
        switch self {
        case .getUsers:
            return "/users"
        case .getAlbums:
            return "/albums"
        case .getPhotos:
            return "/photos"
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
