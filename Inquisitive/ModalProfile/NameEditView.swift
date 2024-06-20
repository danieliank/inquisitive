//
//  NameEditView.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 21/06/24.
//

import SwiftUI

struct NameEditView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var name: String
    @State private var newName: String = ""

    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/3)
            .foregroundColor(Color(hex:"005A71"))
            .overlay{
                VStack(spacing: 16) {
                    Text("Edit Name")
                        .font(.headline)
                    
                    TextField("Enter new name", text: $newName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    HStack {
                        Button("Cancel") {
                            dismiss()
                        }
                        .padding()
                        
                        Spacer()
                        
                        Button("Save") {
                            name = newName
                            dismiss()
                        }
                        .padding()
                        .disabled(newName.isEmpty)
                    }
                }
                .padding()
                .onAppear {
                    newName = name
                }
            }
    }
}
