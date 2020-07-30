//
//  AppDependenciesContainer.swift
//  Project
//
//  Created by Milos Otasevic on 29/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

import Foundation

class AppDependenciesContainer:  ServiceInformationVCDataSourceDependencies{
    var infoUseCase: InfoUseCase = InfoInteractor(provider: InfoProvider())
}
