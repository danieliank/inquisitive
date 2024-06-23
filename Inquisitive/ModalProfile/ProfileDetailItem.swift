//
//  ProfileDetailItem.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 20/06/24.
//

import SwiftUI

struct ProfileDetailItem: View {
    var title: String
    @Binding var selectedOption: String
    var options: [OptionItem]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 24))
                .foregroundColor(Color(hex: "9E9D9E"))
            
            RoundedRectangle(cornerRadius: 16)
                .frame(height: 120)
                .foregroundColor(Color(hex:"F7F7F7"))
                .shadow(radius: 10, x: 2 , y: 4)
                .overlay{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 96), spacing: 16)], spacing: 40) {
                        ForEach(options) { option in
                            OptionButton(option: option, isSelected: selectedOption == option.name) {
                                selectedOption = option.name
                            }
                        }
                    }
                    .padding(.vertical, 16)
                }
        }
    }
}

struct OptionItem: Identifiable {
    var id: String { name }
    var name: String
    var imageName: String?
    var color: String?

    init(name: String, imageName: String? = nil, color: String? = nil) {
        self.name = name
        self.imageName = imageName
        self.color = color
    }

    init(from skinTone: SkinTone) {
        self.name = skinTone.name
        self.color = skinTone.color
    }
    
    init(from faceShape: FaceShape) {
        self.name = faceShape.name
        self.imageName = faceShape.imageName
    }
    
    init(from expression: Expression) {
        self.name = expression.name
        self.imageName = expression.imageName
    }
    
    init(from hairstyle: Hairstyle) {
        self.name = hairstyle.name
        self.imageName = hairstyle.imageName
    }
}

struct OptionButton: View {
    var option: OptionItem
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        VStack {
            if let imageName = option.imageName {
                Image(imageName)
                    .resizable()
                    .frame(width: 64, height: 64)
                    .background(isSelected ? Color.blue.opacity(0.3) : Color.clear)
                    .clipShape(Circle())
            } else if let color = option.color {
                Circle()
                    .fill(Color(hex: color))
                    .frame(width: 64, height: 64)
                    .overlay(Circle().stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2))
            }

            Text(option.name)
                .font(.system(size: 16))
                .foregroundColor(isSelected ? Color(hex: "005A71") : Color(hex: "444D69"))
        }
        .frame(width: 80, height: 100) // Fixed frame to prevent layout shift
        .onTapGesture {
            action()
        }
    }
}
