//
//  StringExtension.swift
//  Project
//
//  Created by Milos Otasevic on 29/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

import Foundation

extension String{
    func formatDate(time: Bool) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sZ"
        let dateFormat = dateFormatter.date(from: self)
        if dateFormat == nil {return ""}
        if time{
            dateFormatter.dateFormat = "HH:mm"
        } else{
            dateFormatter.dateFormat = "dd/MM/yyyy"
        }
        let date = dateFormatter.string(from: dateFormat!)
        return "\(date)"
    }
}
