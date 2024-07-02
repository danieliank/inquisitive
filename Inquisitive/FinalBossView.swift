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
    let correctAnswer = 10
    
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
                        Text("To solve the problem, we use the equivalence s(A)=s(B), where s(A) represents the monster and s(B)the ship. This compares the monster’s constant velocity to the ship’s constant acceleration, equating them as: **v(A).t = v(B)t + ½ at² - (s-c)**")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                        Text("Here, **v(A)** is the monster's initial speed, **v(B)** the ship's initial speed, **a** the acceleration, **s** the distance between them, and **c** the accuracy criterion (0<c≤10). Solving for a yields: **a=(2(v(A)⋅t−v(B)⋅t−(s−c)) / t²**")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                        
                        Text("In this scenario, Blackbeard’s ship will cover 0.6 km in 10 seconds, and must maintain acceleration speed between **10 m/s²** to avoid cannonball impact.")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 20)
                    }
                    else{
                        Text("Captain Blackbeard's pirate ship, sailing through dangerous waters, encounters a formidable sea monster moving at a constant speed of 10 m/s. The pirate ship, which was initially traveling at a speed of 10 m/s, was 0.51 kilometers from the sea monster. To prepare a strategic attack, Captain Blackbeard needed about 10 seconds before the cannon was fired with a guaranteed hit distance of at least 10 meters.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                        Text("To ensure the cannonballs hit the sea monster precisely and without risk of canonball impact, Captain Blackbeard needed to adjust his ship's acceleration. What acceleration range (in m/s²) must Captain Blackbeard's ship achieve to cover the distance safely in 10 seconds?")
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
                        Text("m/s²")
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
                        .foregroundColor(validationMessage == "Correct" ? .green : Color(hex: "B13A26"))
                        .shadow(color: .white, radius: 4)
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
