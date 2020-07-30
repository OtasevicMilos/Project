//
//  Info.swift
//  Project
//
//  Created by Milos Otasevic on 06/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

import Foundation

struct Info: Codable{
    let text: String
    let time: String
    
    enum CodingKeys: String, CodingKey {
        case text = "service_info_text"
        case time = "created_at"
    }
}
