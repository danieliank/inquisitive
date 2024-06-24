//
//  ProfileDetailView.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 20/06/24.
//

import SwiftUI

struct ProfileDetailView: View {
    @ObservedObject var profileConfig: ProfileConfiguration
    @State private var isEditingName: Bool = false

    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .center) {
                    ZStack {
                        Circle()
                            .fill(Color(hex: profileConfig.selectedProfileBackground?.color ?? "#FFFFFF"))
                            .frame(width: 360, height: 360)
                            .shadow(radius: 10, x: 2, y: 4)
                        
                        ZStack {
                            if let faceShape = profileConfig.selectedFaceShape {
                                Image(faceShape.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 240, height: 240) // Fixed size to prevent layout shift
                            }
                            
                            if let expression = profileConfig.selectedExpression {
                                Image(expression.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 160, height: 160) // Fixed size to prevent layout shift
                            }
                            
                            if let hairstyle = profileConfig.selectedHairstyle {
                                Image(hairstyle.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 240, height: 240) // Fixed size to prevent layout shift
                            }
                        }
                    }
                    
                    HStack {
                        Text(profileConfig.profile.name)
                            .font(.system(size: 64))
                            .foregroundColor(Color(hex: "374362"))
                        
                        Button(action: {
                            isEditingName.toggle()
                        }) {
                            Image(systemName: "pencil.line")
                                .font(.system(size: 24))
                                .foregroundColor(Color(hex: "A2A6C0"))
                                .padding(.top, 16)
                        }
                    }
                    
                    Text("Supadupa Genius")
                        .font(.system(size: 24).bold())
                        .foregroundColor(Color(hex: "36B7D6"))
                }
                
                VStack(alignment: .leading) {
                    ProfileDetailItem(
                        title: "Profile Background",
                        selectedOption: Binding(
                            get: { profileConfig.selectedProfileBackground?.name ?? "" },
                            set: { name in profileConfig.selectedProfileBackground = availableProfileBackground.first { $0.name == name } }
                        ),
                        options: availableProfileBackground.map { OptionItem(from: $0) }
                    )
                    ProfileDetailItem(
                        title: "Face Shape",
                        selectedOption: Binding(
                            get: { profileConfig.selectedFaceShape?.name ?? "" },
                            set: { name in profileConfig.selectedFaceShape = availableFaceShapes.first { $0.name == name } }
                        ),
                        options: availableFaceShapes.map { OptionItem(from: $0) }
                    )
                    ProfileDetailItem(
                        title: "Expression",
                        selectedOption: Binding(
                            get: { profileConfig.selectedExpression?.name ?? "" },
                            set: { name in profileConfig.selectedExpression = availableExpressions.first { $0.name == name } }
                        ),
                        options: availableExpressions.map { OptionItem(from: $0) }
                    )
                    ProfileDetailItem(
                        title: "Hairstyle",
                        selectedOption: Binding(
                            get: { profileConfig.selectedHairstyle?.name ?? "" },
                            set: { name in profileConfig.selectedHairstyle = availableHairstyles.first { $0.name == name } }
                        ),
                        options: availableHairstyles.map { OptionItem(from: $0) }
                    )
                }
                .padding(.horizontal, 16)
            }
            .padding(.vertical, 16)
            
            if isEditingName {
                NameEditView(name: $profileConfig.profile.name, isEditing: $isEditingName)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

let availableProfileBackground = [
    ProfileBackground(name: "Pale", color: "#F2D7D5"),
    ProfileBackground(name: "Tan", color: "#D2B48C"),
    ProfileBackground(name: "Dark", color: "#8B4513")
]

let availableFaceShapes = [
    FaceShape(name: "Round", imageName: "round_image"),
    FaceShape(name: "Square", imageName: "square_image"),
    FaceShape(name: "Oval", imageName: "oval_image")
]

let availableExpressions = [
    Expression(name: "Happy", imageName: "happy_image"),
    Expression(name: "Neutral", imageName: "neutral_image"),
    Expression(name: "Sad", imageName: "sad_image")
]

let availableHairstyles = [
    Hairstyle(name: "Short", imageName: "short_image"),
    Hairstyle(name: "Medium", imageName: "medium_image"),
    Hairstyle(name: "Long", imageName: "long_image")
]
