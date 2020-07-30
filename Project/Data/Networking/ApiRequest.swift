//
//  ApiRequest.swift
//  Project
//
//  Created by Milos Otasevic on 29/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

import Foundation

struct ApiRequest{
    private let baseUrlString: String = "https://test.ovpg.me"
    private let endpoint: Endpoint
    
    init(endpoint: Endpoint){
        self.endpoint = endpoint
    }
    
    var urlRequest: URLRequest?{
        let urlString = baseUrlString + "/" + endpoint.parameters
        guard let url = URL(string: urlString) else {return nil}
        return URLRequest(url: url)
    }
}
