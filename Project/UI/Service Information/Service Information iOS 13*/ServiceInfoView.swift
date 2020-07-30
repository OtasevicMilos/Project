//
//  ServiceInfoView.swift
//  Project
//
//  Created by Milos Otasevic on 29/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
struct ServiceInfoView: View {
    let dataSource: ServiceInformationVCDataSource
    
    @State var infos = [Info]()
    var body: some View {
        VStack{
            Spacer( minLength: 20)
            Text("OBAVJEŠTENJA")
                .font(Font.custom("OpenSans-Bold", size: 23))
                .kerning(2)
            Spacer( minLength: 20)
            ZStack{
                VStack{
                    Image("bluuue")
                        .offset(y: -40)
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width, height: 500)
                List(infos,  id: \.time){ info in
                    InfoView(info: info)
                }
                .onAppear(perform: {
                    UITableView.appearance().separatorStyle = .none
                    UITableView.appearance().backgroundColor = .clear
                    UITableViewCell.appearance().backgroundColor = .clear
                })
            }
        }.onAppear{
            self.dataSource.feedback = self
            self.dataSource.fetchInfo()
        }
    }
}

@available(iOS 13.0, *)
extension ServiceInfoView: ServiceInformationVCDataSourceFeedback{
    func dataUpdated() {
        infos = dataSource.infos
    }
    
    func noInternet() {
        return
    }
}
#endif
