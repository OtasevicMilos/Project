//
//  AppCoordinator.swift
//  Project
//
//  Created by Milos Otasevic on 29/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

import UIKit

#if canImport(SwiftUI)
import SwiftUI
#endif

class AppCoordinator{
    let window: UIWindow
    let tabBar = UITabBarController()
    let dependencies = AppDependenciesContainer()
    
    init(widnow: UIWindow = UIWindow(frame: UIScreen.main.bounds)){
        self.window = widnow
    }
    
    func start(){
        if #available(iOS 13.0, *) {
            let hostingServiceInfoView = UIHostingController(rootView: ServiceInfoView(dataSource: ServiceInformationVCDataSource(dependencies: dependencies)))
            window.rootViewController = hostingServiceInfoView
            window.makeKeyAndVisible()
        }else{
            let serviceInformationVC = ServiceInformationViewController(dataSource: ServiceInformationVCDataSource(dependencies: dependencies))
            window.rootViewController = serviceInformationVC
            window.makeKeyAndVisible()
        }
    }
}
