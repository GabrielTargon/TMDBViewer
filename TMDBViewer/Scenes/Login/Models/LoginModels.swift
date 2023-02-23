//
//  LoginModels.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 22/10/22.
//

import Foundation

enum Login {
    
    enum User {
        struct Request {
            let username: String
            let password: String
        }
        
        struct Response {
            
        }
        
        struct ViewModel {
            
        }
    }
    
    struct TokenRequest: Codable {
        public let success: Bool
        public let expiresAt: String
        public let requestToken: String
    }

    struct SessionRequest: Codable {
        public let username: String
        public let password: String
    }

    struct SessionResponse: Codable {
        public let success: Bool
    }
}
