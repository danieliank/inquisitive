//
//  JustProfileView.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 25/06/24.
//

import SwiftUI

struct JustProfileView: View {
    @ObservedObject var dat: Database
    
    var body: some View {
        ZStack {
            Rectangle()
                // background color
                .foregroundColor( dat.selectedBackgroundColor)
                .frame(width: 300, height: 300)
                .overlay{
                    Image("Map/Head")
            }
            
            // hair
            if dat.selectedHairStyle != "Map/none"{
                Image(dat.selectedHairStyle)
            }
            // face
            Image(dat.selectedFace)
                .resizable()
                .frame(width: 166,height: 166)
        }
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    JustProfileView(dat:Database())
}
