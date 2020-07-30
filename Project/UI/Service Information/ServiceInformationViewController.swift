//
//  ServiceInformationViewController.swift
//  Project
//
//  Created by Milos Otasevic on 29/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

import UIKit

class ServiceInformationViewController: UIViewController {
    @IBOutlet weak var noticesLable: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var emptyLable: UILabel!
    let dataSource: ServiceInformationVCDataSource
    
    init(dataSource: ServiceInformationVCDataSource){
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLableText = "OBAVJEŠTENJA"
        let newsletterMutableString = NSMutableAttributedString(string: titleLableText,  attributes: [
            NSAttributedString.Key.font: UIFont(name: "OpenSans-Bold", size: 26) as Any,
            NSAttributedString.Key.kern:CGFloat(2.0)
        ])
        self.noticesLable.attributedText = newsletterMutableString
        self.dataSource.feedback = self
        self.setTable()
    }
    
    private func setTable(){
        self.dataSource.fetchInfo()
        self.table.delegate = self
        self.table.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: self.dataSource.infoCellID)
        self.table.separatorStyle = .none
        self.table.dataSource = self.dataSource
        self.table.allowsSelection = false
    }
}

//MARK: UITableViewDelegate
extension ServiceInformationViewController: UITableViewDelegate{
}

//MARK: ServiceInformationVCDataSourceFeedback
extension ServiceInformationViewController: ServiceInformationVCDataSourceFeedback{
    func dataUpdated() {
        self.table.reloadData()
        if dataSource.infos.count > 0{
            self.emptyLable.text = ""
        }else{
            self.emptyLable.text = "Trenutno nema obavještenja"
        }
    }
    
    func noInternet(){
        let alert = UIAlertController(title: nil, message: "Check internet connection.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (act) in
            self.dataSource.fetchInfo()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
