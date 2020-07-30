//
//  Response.swift
//  Project
//
//  Created by Milos Otasevic on 29/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

import Foundation

enum Response<T>{
    case success(T)
    case error(Error)
}
