//
//  PhotosEndpoint.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import Foundation
import CoreNetwork

public enum PhotosEndpoint {
    case getPhotos(albumId: Int)
}

extension PhotosEndpoint: HTTPEndpoint {
    public var baseURL: String {
        CommonMovieService.baseURL
    }
    
    public var path: String {
        switch self {
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
        switch self {
        case .getPhotos(let albumId):
            let quesrtyItems = URLQueryItem(name: "albumId", value: String(describing: albumId))
            return [quesrtyItems]
        }
    }
    
    public var timeout: TimeInterval? {
        30
    }
}
