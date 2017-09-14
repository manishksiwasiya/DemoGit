//
//  Configuration.swift
//  GitDemo
//
//  Created by Dark Bear on 14/09/17.
//  Copyright © 2017 Dark Bear. All rights reserved.
//

import Foundation

struct Configuration {
    lazy var environment: Environment = {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            
            if configuration.range(of:"Staging", options:.regularExpression) != nil {
                return Environment.Staging
            }
        }
        
        return Environment.Production
    }()
}

enum Environment: String {
    case Staging = "staging"
    case Production = "production"
    
    var baseURL: String {
        switch self {
        case .Staging: return "https://staging-api.myservice.com"
        case .Production: return "https://api.myservice.com"
        }
    }
    
    var token: String {
        switch self {
        case .Staging: return "lktopir156dsq16sbi8"
        case .Production: return "5zdsegr16ipsbi1lktp"
        }
    }
}
