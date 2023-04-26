//
//  LoginSeeds.swift
//  TMDBViewerTests
//
//  Created by Gabriel Targon on 25/04/23.
//

@testable import TMDBViewer
import Foundation

struct LoginSeeds {
    
    static let requestLoginStub: Login.User.Request = {
        return Login.User.Request(username: "user",
                                  password: "pass")
    }()
    
    static let validateLoginStub: Login.User.Response = {
        return Login.User.Response(username: "user",
                                   password: "pass",
                                   requestToken: "xxxxxxxx")
    }()
    
    static let requestTokenStub: Login.TokenRequest = {
        return Login.TokenRequest(success: true,
                                  expiresAt: "2016-08-26 17:04:39 UTC",
                                  requestToken: "xxxxxxxx")
    }()
    
    static let sessionResponseStub: Login.SessionResponse = {
        return Login.SessionResponse(success: true)
    }()
}
