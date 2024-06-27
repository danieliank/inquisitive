//
//  FinalBossView.swift
//  Inquisitive
//
//  Created by Felicia Himawan on 27/06/24.
//

import SwiftUI

struct FinalBossView: View {
    @ObservedObject var dat: Database
    @State private var isClosePressed = false
    @State private var isCorrect = false
    @State private var showMessage = false
    @Environment(\.presentationMode) var presentationMode
    
    @State private var userAnswer: String = ""
    @State private var validationMessage: String = ""
    let correctAnswer = 4
    
    var body: some View {
        ZStack{
            
            Image(isCorrect ? "Boss/BOSSDONE" : "Boss/FINALBOSS")
                .animation(.easeOut(duration: 1.5))
               
            
            //===close button===
            if !isCorrect{
                VStack{
                    HStack {
                        Button(action:{
                            isClosePressed = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                isClosePressed = false
                            }
                            self.presentationMode.wrappedValue.dismiss()
                            // back to menu (keluar)
                        }){
                            Image(isClosePressed ? "Buttons/closePressed" : "Buttons/close")
                                .resizable()
                                .frame(width: 64, height: 64)
                                .padding([.top, .leading], 50)
                        }
                        Spacer()
                        
                    }
                    Spacer()
                }
            }
            
            //===Text final boss===
            VStack{
                HStack {
                    if isCorrect{
                        Text("Congrats, you defeated the final boss!")
                            .font(.system(size: 48).bold())
                            .foregroundColor(Color(hex: "388E74"))
                            .stroke(color: Color(hex: "F1FFF9"), width: 5)
                            .shadow(color: Color(hex: "BAE1D0"), radius: 3)
                    }
                    else{
                        Text("Final Boss!")
                            .font(.system(size: 48).bold())
                            .foregroundColor(Color(hex: "374362"))
                            .stroke(color: Color(hex: "EBEDF0"), width: 5)
                            .shadow(radius: 3)
                    }
                    
                    
                }
                Spacer()
            }
            .padding(.top, 50)
            
            
            VStack{
                //===The Question===
                VStack{
                    if isCorrect{
                        Text("Let's break it down together!")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                        Text("To solve this daring challenge, we employ the trusty second equation of motion. This equation describes how distance, initial speed, acceleration, and time are interconnected. Here’s how it unfolds: s=v(t)*1/2a*t^2.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                        Text("In this thrilling scenario, Blackbeard's ship begins its journey at v=10 m/s, aims to cover s=300 meters, and has precisely t=10 seconds to achieve this heroic feat.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                        
                        Text("From there, Captain Blackbeard's ship must accelerate at a brave 4m/s2")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 20)
                    }
                    else{
                        Text("Captain Blackbeard is sailing the high seas in search of a fearsome sea monster. He spots the monster 300 meters away and wants to reach it as quickly as possible. His ship can start from 10 meters per second (m/s) and accelerate uniformly.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                        Text("To reach the sea monster in 10 seconds, what constant acceleration does Blackbeard need his ship to have?")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex: "374362"))
                    }
                    
                }
                .multilineTextAlignment(.center)
                .padding(.top, 200)
                
               
                
                //===textfield===
                if !isCorrect{
                    HStack{
                        Spacer()
                        Text("a =")
                            .font(.system(size: 64).bold())
                            .foregroundColor(Color(hex: "044EA2"))
                        TextField("", text: $userAnswer)
                            .keyboardType(.numberPad)
                            .disableAutocorrection(true)
                            .frame(width: 150)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .font(.system(size: 64))
                        Text("m/s")
                            .font(.system(size: 64))
                            .foregroundColor(Color(hex: "374362"))
                        Spacer()
                    }
                    .padding(.top, 30)
                }
                
                //==submit button===
                RoundedRectangle(cornerRadius: 24)
                    .frame(width: 180, height: 70)
                    .foregroundColor(Color(hex: "EFEFEF"))
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    .overlay{
                        Button(action: {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            
                            if isCorrect{
                                showMessage = false
                                
                             
                                //dat.isHairStyle3Unlock = true
                                dat.isHaveBadge1 = true
                                dat.checkForNewlyUnlockedItem()
                                
                                self.presentationMode.wrappedValue.dismiss()
                            }
                            //validasi jawaban
                            if let userAnswerNumber = Int(userAnswer) {
                                if userAnswerNumber == correctAnswer {
                                    isCorrect = true
                                    validationMessage = ""
                                    
                                }
                                else {
                                    validationMessage = "Incorrect, try again!"
                                }
                            }
                            else {
                                validationMessage = "Invalid input, please enter a number"
                            }
                            
                            showMessage = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                showMessage = false
                            }
                            
                            
                        }) {
                            Text(isCorrect ? "continue" : "Submit")
                                .font(.system(size: 32).bold())
                                .foregroundColor(Color(hex:"374362"))
                        }
                    }
                    .padding(.bottom, 4)
                    
                
                if showMessage{
                    Text(validationMessage)
                        .font(.system(size: 24).bold())
                        .foregroundColor(validationMessage == "Correct" ? .green : .red)
                        .transition(.opacity)
                }
                
                Spacer()
               
            }
            .frame(width: UIScreen.main.bounds.width - 332, height: UIScreen.main.bounds.height)
            
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    FinalBossView(dat: Database())
}
