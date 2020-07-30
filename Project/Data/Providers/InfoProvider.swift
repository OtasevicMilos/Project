//
//  InfoProvider.swift
//  Project
//
//  Created by Milos Otasevic on 06/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

import Foundation

class InfoProvider: MainProvider, InfoProviderProtocol{
    
    func getInfos(completion: @escaping(Response<[Info]>) -> Void){
        guard let request = ApiRequest(endpoint: .serviceInfo).urlRequest else { return }
        webService.execute(request) { (response: Response<InfoResponse>) in
            switch response{
            case .success(let resp):
                completion(.success(resp.data))
            case .error(let error):
                completion(.error(error))
            }
        }
        
    }

}

struct InfoResponse: Codable{
    let data: [Info]
}
