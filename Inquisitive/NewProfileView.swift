//
//  NewProfileVIew.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 25/06/24.
//

import SwiftUI

struct NewProfileView: View {
    @ObservedObject var dat: Database
    @State private var isEditingName: Bool = false
    let backgroundColors = ["3E8A74", "3E668A", "B13A26", "786C60"]
    let faces = ["Map/Face1", "Map/Face2", "Map/Face3", "Map/Face4", "Map/Face5", "Map/Face6"]
    let hairstyles = ["Map/none", "Map/HairStyle1", "Map/HairStyle2", "Map/HairStyle3", "Map/HairStyle4", "Map/HairStyle5"]
    
    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .frame(width: UIScreen.main.bounds.width - 344, height: UIScreen.main.bounds.height - 240)
            .foregroundColor(Color(hex: "F6F6FB"))
            .overlay {
                HStack(spacing: 50) {
                    // Left
                    VStack(spacing: 20){
                        ZStack {
                            Image("Map/Shelf1")
                            HStack(spacing:12){
                                Image(dat.isHaveBadge1 ?"Map/Badge1":"Map/Badge1Lock")
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(radius: 5, x:2, y:3)
                                Image(dat.isHaveBadge2 ?"Map/Badge2":"Map/Badge2Lock")
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(radius: 5, x:2, y:3)
                                Image(dat.isHaveBadge3 ?"Map/Badge3":"Map/Badge3Lock")
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(radius: 5, x:2, y:3)
                            }
                            .padding(.horizontal, 8)
                            .padding(.top)
                            .padding()
                        }
                        
                        ZStack {
                            Image("Map/Shelf2")
                            HStack(spacing:12){
                                Image(dat.isHaveBadge4 ?"Map/Badge4":"Map/Badge4Lock")
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(radius: 5, x:2, y:3)
                                Image(dat.isHaveBadge5 ?"Map/Badge5":"Map/Badge5Lock")
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(radius: 5, x:2, y:3)
                                Image(dat.isHaveBadge6 ?"Map/Badge6":"Map/Badge6Lock")
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(radius: 5, x:2, y:3)
                            }
                            .padding(24)
                        }
                        
                        ZStack {
                            Image("Map/Shelf2")
                            HStack(spacing:12){
                                Image(dat.isHaveBadge1 ?"Map/Badge7":"Map/Badge1Lock")
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(radius: 5, x:2, y:3)
                                Image(dat.isHaveBadge2 ?"Map/Badge8":"Map/Badge2Lock")
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(radius: 5, x:2, y:3)
                                Image(dat.isHaveBadge3 ?"Map/Badge9":"Map/Badge3Lock")
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(radius: 5, x:2, y:3)
                            }
                            .padding(24)
                        }
                        
                        ZStack {
                            Image("Map/Shelf3")
                            HStack(spacing:12){
                                Image(dat.isHaveBadge4 ?"Map/Badge10":"Map/Badge4Lock")
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(radius: 5, x:2, y:3)
                                Image(dat.isHaveBadge5 ?"Map/Badge11":"Map/Badge5Lock")
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(radius: 5, x:2, y:3)
                                Image(dat.isHaveBadge6 ?"Map/Badge12":"Map/Badge6Lock")
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(radius: 5, x:2, y:3)
                            }
                            .padding(24)
                        }
                    }
                    
                    // Right
                    VStack(spacing: 16) {
                        // Profile View + Color
                        HStack(spacing: 50) {
                            Spacer()
                            JustProfileView(dat: dat)
                                .frame(width: 300, height: 300)
                            
                            VStack(spacing: 16) {
                                ForEach(backgroundColors, id: \.self) { color in
                                    Circle()
                                        .foregroundColor(Color(hex: color))
                                        .onTapGesture {
                                            dat.selectedBackgroundColor = Color(hex: color)
                                        }
                                }
                            }
                        }
                        
                        VStack(spacing: 40) {
                            HStack(spacing: 16) {
                                Spacer()
                                if isEditingName {
                                    TextField("Enter name", text: $dat.userName, onCommit: {
                                        isEditingName.toggle()
                                    })
                                    .font(.system(size: 48).weight(.semibold))
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .multilineTextAlignment(.center)
                                } else {
                                    Text(dat.userName)
                                        .font(.system(size: 48).weight(.semibold))
                                }
                                Image(systemName: "pencil.line")
                                    .font(.system(size: 48))
                                    .foregroundColor(Color(hex: isEditingName ? "414351" : "A2A6C0"))
                                    .onTapGesture {
                                        isEditingName.toggle()
                                    }
                                Spacer()
                            }
                            //                        }
                            
                            VStack(spacing: 20) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Expression")
                                    HStack(spacing: 12) {
                                        ForEach(faces, id: \.self) { face in
                                            ZStack {
                                                Circle()
                                                    .foregroundColor(Color(hex: "EFD2BC"))
                                                    .overlay {
                                                        if canSelectFace(face){
                                                            Image(face)
                                                                .resizable()
                                                                .scaledToFit()
                                                                .padding(8)
                                                        }else{
                                                            Image("Map/lock")
                                                        }
                                                    }
                                            }
                                            .onTapGesture {
                                                if canSelectFace(face){
                                                    dat.selectedFace = face
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Hair")
                                    HStack(spacing: 12) {
                                        ForEach(hairstyles, id: \.self) { hair in
                                            Circle()
                                                .foregroundColor(Color(hex: "E3E6EE"))
                                                .overlay {
                                                    if hair == "Map/none"{
                                                        Image(hair)
                                                    }else{
                                                        if canSelectHairStyle(hair) {
                                                            Image(hair)
                                                                .resizable()
                                                                .frame(width: 66, height: 66)
                                                                .scaledToFit()
                                                                .padding(8)
                                                        }else{
                                                            Image("Map/lock")
                                                        }
                                                    }
                                                    
                                                }
                                                .onTapGesture {
                                                    if canSelectHairStyle(hair) {
                                                        dat.selectedHairStyle = hair
                                                    }
                                                }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(44)
            }
    }
    private func canSelectFace(_ face: String) -> Bool {
        switch face {
        case "Map/Face3":
            return dat.isFace3Unlock
        case "Map/Face4":
            return dat.isFace4Unlock
        case "Map/Face5":
            return dat.isFace5Unlock
        case "Map/Face6":
            return dat.isFace6Unlock
        default:
            return true
        }
    }
    
    private func canSelectHairStyle(_ hair: String) -> Bool {
        switch hair {
        case "Map/HairStyle3":
            return dat.isHairStyle3Unlock
        case "Map/HairStyle4":
            return dat.isHairStyle4Unlock
        case "Map/HairStyle5":
            return dat.isHairStyle5Unlock
        default:
            return true
        }
    }
    
}

#Preview {
    NewProfileView(dat: Database())
}
