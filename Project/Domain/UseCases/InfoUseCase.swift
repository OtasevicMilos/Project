//
//  InfoUseCase.swift
//  Project
//
//  Created by Milos Otasevic on 06/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

import Foundation

protocol InfoUseCase {
    func getInfos(completion: @escaping(Response<[Info]>) -> Void)
}
