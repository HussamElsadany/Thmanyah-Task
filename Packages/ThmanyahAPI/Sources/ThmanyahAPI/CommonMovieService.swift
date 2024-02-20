//
//  CommonMovieService.swift
//
//
//  Created by Hussam Elsadany on 13/01/2024.
//

import Foundation
import AppEnvironment

/// Common urls that will be used, not the best place to read from Environment directly, should be injected with a environment protocol.
// TODO: Modify this logic to be got injected from AppEnvironment.
public enum CommonMovieService {
    
    static let supportedLanguages = Set(Bundle.main.localizations)
    
    public static var baseURL: String {
        let apiBaseURL: String = AppEnvironment.current.getValue(.apiBaseURL)
        return "https://\(apiBaseURL)"
    }
    
    public static var baseImagesURL: String {
        let apiImageBaseURL: String = AppEnvironment.current.getValue(.apiImageBaseURL)
        return "https://\(apiImageBaseURL)"
    }
    
    public static var language: String {
        guard let current = Locale.current.language.languageCode?.identifier,
              CommonMovieService.supportedLanguages.contains(current) else {
            return "en"
        }
        return current
    }
    
    public static var queryItems: [URLQueryItem] {
        let language = URLQueryItem(name: "language", value: CommonMovieService.language)
        return [language]
    }
}
