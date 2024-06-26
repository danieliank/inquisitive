//
//  ExerciseViewGLBB_V.swift
//  Inquisitive
//
//  Created by Felicia Himawan on 26/06/24.
//
import SwiftUI

struct ExerciseViewGLBB_V: View {
    @ObservedObject var dat: Database
    @State private var isClosePressed = false
    @State private var isCorrect = false
    @State private var showMessage = false
    @Environment(\.presentationMode) var presentationMode
    
    @State private var userAnswer: String = ""
    @State private var validationMessage: String = ""
    let correctAnswer = 50
    
    
    var body: some View {
        ZStack{
            //===image coconut===
            VStack{
                
                Spacer()
                
                Image("MateriGLBB_V/sandCoconutMateri")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    
                  
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
                        Text("In this scenario, the coconut starts its fall from rest, meaning its initial velocity is 0 m/s and the acceleration due to gravity we use is 10 m/s^2. To find the coconut's final velocity just before hitting the ground, we utilize the equation for constant acceleration in vertical motion which is v(t)=v(0)+g*t")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                        
                        Text("Therefore, the final velocity of the coconut just before it hits the sandy is 50m/s.")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                    }
                    else{
                        Text("Imagine a ripe coconut hanging at the top of a towering palm tree, basking in the warm tropical breeze. Suddenly, it detaches from its stem and begins its free fall towards the sandy ground below. The coconut takes 5 seconds to descend to the ground. Assume constant acceleration due to gravity and let's round off the value (g = 10 m/s^2).")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 10)
                        Text("What is its final velocity just before impact?")
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
                        Text("V =")
                            .font(.system(size: 64).bold())
                            .foregroundColor(Color(hex: "36B7D6"))
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
                    .padding(.bottom, 30)
                }
                
                //==submit button===
                RoundedRectangle(cornerRadius: 24)
                    .frame(width: 180, height: 70)
                    .foregroundColor(Color(hex: "EFEFEF"))
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    .overlay{
                        Button(action: {
                            if isCorrect{
                                //validationMessage = "go to map"
                                
                                // unlock new item + fog (exercise case)
                                dat.isFog3 = true
                                dat.isHairStyle5Unlock = true
                                dat.isFace6Unlock = true
                                dat.checkForNewlyUnlockedItem()
                                
                                dat.Kinematics_Challenge = true
                                self.presentationMode.wrappedValue.dismiss()
                            }
                            else{
                                //validasi jawaban
                                if let userAnswerNumber = Int(userAnswer) {
                                    if userAnswerNumber == correctAnswer {
                                        validationMessage = ""
                                        isCorrect = true
                                    }
                                    else {
                                        validationMessage = "Incorrect, try again!"
                                    }
                                }
                                else {
                                    validationMessage = "Invalid input, please enter a number"
                                }
                            }
                            
                            showMessage = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
            
            .frame(width: UIScreen.main.bounds.width - 332, height: UIScreen.main.bounds.height - 400)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ExerciseViewGLBB_V(dat: Database())
}
