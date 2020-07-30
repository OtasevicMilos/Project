//
//  InfoView.swift
//  Project
//
//  Created by Milos Otasevic on 29/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct InfoView: View {
    @State var info: Info
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 0.1)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: Color( #colorLiteral(red: 0.8392447829, green: 0.8863856792, blue: 0.9640881419, alpha: 1)), radius: 5)
                .padding(5)
            VStack{
                HStack{
                    Text(info.text)
                        .font(Font.custom("Muli-Light", size: 12))
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                HStack{
                    Rectangle()
                        .frame(width: 120, height: 0.5)
                        .background(Color(#colorLiteral(red: 0.08218853921, green: 0.3449231982, blue: 0.7226979733, alpha: 1)))
                    
                    Spacer()
                }
                HStack{
                    Text(info.time.formatDate(time: false))
                        .font(Font.custom("Muli-Regular", size: 11))
                        .foregroundColor(Color(#colorLiteral(red: 0.08543542773, green: 0.3408555686, blue: 0.7187034488, alpha: 1)))
                    Rectangle()
                        .frame(width: 0.5, height: 10)
                        .background(Color(#colorLiteral(red: 0.6482979655, green: 0.6902532578, blue: 0.7508081794, alpha: 1)))
                    Text(info.time.formatDate(time: true))
                        .font(Font.custom("Muli-Regular", size: 11))
                        .foregroundColor(Color(#colorLiteral(red: 0.5065657496, green: 0.5761552453, blue: 0.6841099858, alpha: 1)))
                    Spacer()
                }
            }
            .padding(20)
        }
    }
}
@available(iOS 13.0, *)
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(info: Info(text: "TEST", time: "2020-07-29T13:08:43.000000Z"))
            .previewLayout(PreviewLayout.fixed(width: 500, height: 150))
            .padding()
            .previewDisplayName("Default preview")
    }
}
