//
//  NameEditView.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 21/06/24.
//

import SwiftUI

struct NameEditView: View {
    @Binding var name: String
    @Binding var isEditing: Bool
    @State private var newName: String = ""

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .frame(width: UIScreen.main.bounds.width*2/3, height: UIScreen.main.bounds.height*2/5)
                .foregroundColor(Color(hex:"005A71"))
                .overlay {
                    VStack{
                        Text("Edit Name")
                            .font(.system(size: 64).bold())
                            .foregroundColor(Color(hex: "F7F7F7"))
                            .padding(.bottom, 40)
                        
                        TextField("Enter new name", text: $newName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 32)
                        
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                isEditing = false
                            }){
                                Text("Cancel")
                                    .font(.system(size: 32).bold())
                                    .foregroundColor(Color(hex: "F7F7F7"))
                                    .padding([.trailing], 80)
                            }
                            
                            Button(action: {
                                name = newName
                                isEditing = false
                            }){
                                Text("Save")
                                    .font(.system(size: 32).bold())
                                    .foregroundColor(Color(hex: "F7F7F7"))
                                    .padding([.leading], 80)
                            }
                            .disabled(newName.isEmpty)
                            
                            Spacer()
                        }
                    }
                    .padding(40)
                    .onAppear {
                        newName = name
                    }
                }
        }
    }
}
