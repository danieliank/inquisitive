//
//  ExerciseViewGLBB_H.swift
//  Inquisitive
//
//  Created by Felicia Himawan on 26/06/24.
//
import SwiftUI

struct ExerciseViewGLBB_H: View {
    @ObservedObject var dat: Database
    @State private var isClosePressed = false
    @State private var isCorrect = false
    @State private var showMessage = false
    @Environment(\.presentationMode) var presentationMode
    
    @State private var userAnswer: String = ""
    @State private var validationMessage: String = ""
    let correctAnswer = 55
    
    
    var body: some View {
        ZStack{
            //===image mobil===
            VStack{
                Spacer()
                
                Image("MateriGLBB_H/mobilMateri2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.2/10)
            }
            
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
            
            //===Text Exercise===
            VStack{
                HStack {
                    if isCorrect{
                        Text("You are correct!")
                            .font(.system(size: 48).bold())
                            .foregroundColor(Color(hex: "388E74"))
                            .stroke(color: Color(hex: "F1FFF9"), width: 5)
                            .shadow(color: Color(hex: "BAE1D0"), radius: 3)
                    }
                    else{
                        Text("Exercise!")
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
                        Text("Let's break down the exercise together!")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                        Text("To tackle this, we begin by noting Tom's initial speed is 0 m/s. Over the first 5 seconds, his speed increases uniformly at 2 m/s². Using the equation s(t)=v(0)t+½at², where v(0) is first velocity, t is time, and a is acceleration, to calculate the first 5 seconds distance [s(5)]. This speed is then maintained for the next 3 seconds, then we need to use v(t)=v(0)+at, to calculate 5 seconds velocity [v(5)]. Then we implement GLB by using from v(5) to know the distance 5 seconds until 8 seconds by using equation s=v*∆t, where the ∆t is time from s(5) to s(8). After that we need to add s(5) + s(5,8) to calculate total distance")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                        
                        Text("By using the equation, Tom’s car cover an impressive 55 meters during these 8 seconds drive")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                    }
                    else{
                        Text("Tom loves driving his car on the open road. One day, he starts driving his car from rest (0 m/s) and accelerates at a constant rate of 2 (m/s²) for 5 seconds. Over the next 3 seconds, he continues to drive with this constant acceleration and wonders how far has he traveled already.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 10)
                        Text("Help Tom figure out the distance his car travelled!")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex: "374362"))
                    }
                    
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
                
                
                
                //===textfield===
                if !isCorrect{
                    HStack{
                        Spacer()
                        Text("s =")
                            .font(.system(size: 64).bold())
                            .foregroundColor(Color(hex: "36B7D6"))
                        TextField("", text: $userAnswer)
                            .keyboardType(.numberPad)
                            .disableAutocorrection(true)
                            .frame(width: 150)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .font(.system(size: 64))
                        Text("m")
                            .font(.system(size: 64))
                            .foregroundColor(Color(hex: "374362"))
                        Spacer()
                    }
                    .padding(.bottom, 30)
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
                                dat.isHairStyle4Unlock = true
                                
                                // unlock new item + fog (exercise case)
                                dat.isFog2 = true
                                dat.isHairStyle4Unlock = true
                                dat.checkForNewlyUnlockedItem()
                                
                                dat.exerciseGLBB_HButtonClicked = true
                                dat.ConstantAccelerationVertical_Material = true
                                self.presentationMode.wrappedValue.dismiss()
                            }
                            else{
                                //validasi jawaban
                                if let userAnswerNumber = Int(userAnswer) {
                                    if userAnswerNumber == correctAnswer {
                                        validationMessage = ""
                                        //showMessage = false
                                        isCorrect = true
                                    }
                                    else if userAnswerNumber != correctAnswer {
                                        validationMessage = "Incorrect, try again!"
                                    }
                                    
                                }
                                else {
                                    validationMessage = "Invalid input, please enter a number"
                                }
                                showMessage = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    showMessage = false
                                }
                                
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
            .frame(width: UIScreen.main.bounds.width - 332, height: UIScreen.main.bounds.height - 400)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ExerciseViewGLBB_H(dat: Database())
}
