//
//  InfoInteractor.swift
//  Project
//
//  Created by Milos Otasevic on 06/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

import Foundation

class InfoInteractor: InfoUseCase{
    let provider: InfoProviderProtocol
    
    init(provider: InfoProviderProtocol){
        self.provider = provider
    }
    
    func getInfos(completion: @escaping (Response<[Info]>) -> Void) {
        provider.getInfos(completion: completion)
    }
}
