//
//  ServiceInformationVCDataSource.swift
//  Project
//
//  Created by Milos Otasevic on 29/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

import UIKit

protocol ServiceInformationVCDataSourceDependencies{
    var infoUseCase: InfoUseCase {get}
}

protocol ServiceInformationVCDataSourceFeedback{
    func dataUpdated()
}

class ServiceInformationVCDataSource: NSObject{
    let dependencies: ServiceInformationVCDataSourceDependencies
    let infoCellID = "infoTableViewCell"
    var feedback: ServiceInformationVCDataSourceFeedback?
    var infos = [Info]()
    
    init(dependencies: ServiceInformationVCDataSourceDependencies) {
        self.dependencies = dependencies
    }
    
    func fetchInfo(){
        dependencies.infoUseCase.getInfos { [weak self] response in
            switch response{
            case .success(let info):
                self?.infos = info
                self?.feedback?.dataUpdated()
            case .error(let error):
                print(error)
            }
        }
    }
}

//MARK: UITableViewDataSource
extension ServiceInformationVCDataSource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.infoCellID, for: indexPath)
        guard let infoCell = cell as? InfoTableViewCell else {return cell}
        infoCell.infoTextLable?.text = infos[indexPath.row].text
        infoCell.timeLable.text = infos[indexPath.row].time.formatDate(time: true)
        infoCell.dateLable.text = infos[indexPath.row].time.formatDate(time: false)
        return infoCell
    }
}
