//
//  Endpoint.swift
//  Project
//
//  Created by Milos Otasevic on 29/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

import Foundation

enum Endpoint{
    case singlePhase(id: Int)
    case serviceInfo
    
    var parameters: String{
        switch self {
        case .singlePhase(let id):
            return "api/phases/\(id)?lang=1"
        case .serviceInfo:
            return "api/service-infos?lang=1"
        }
    }
}
