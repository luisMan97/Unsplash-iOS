//
//  APIRouter.swift
//  Unsplash
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import Foundation

enum APIRouter {
    
    case Photos([String: String])
    
    private var method: HTTPMethod {
        switch self {
        case .Photos:
            return .GET
        }
    }
    
    private var path: String {
        switch self {
        case .Photos(let parameters):
            return "photos/".queryString(params: parameters)
        }
    }
    
    private var url: String {
        return APIManagerConstants.endpoint
    }
    
    private var urlRequest: URLRequest? {
        guard let url = URL(string: url) else {
            return nil
        }
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return urlRequest
    }
    
    private var nsUrlRequest: URLRequest? {
        guard let nsUrl = NSURL(string: self.url + path) else {
            return nil
        }
        var urlRequest = URLRequest(url: nsUrl as URL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return urlRequest
    }
    
    var request: URLRequest? {
        switch self {
        case .Photos:
            return nsUrlRequest
        }
    }

}
