//
//  ExerciseViewGLB.swift
//  Inquisitive
//
//  Created by Felicia Himawan on 26/06/24.
//
import SwiftUI

struct ExerciseViewGLB: View {
    @ObservedObject var dat: Database
    @State private var isClosePressed = false
    @State private var isCorrect = false
    @State private var showMessage = false
    @Environment(\.presentationMode) var presentationMode
    
    @State private var userAnswer: String = ""
    @State private var validationMessage: String = ""
    let correctAnswer = 250
    
    
    var body: some View {
        ZStack{
            //===image kereta & rel===
            VStack{
                Spacer()
                Image("MateriGLB/REL")
                    .frame(width: UIScreen.main.bounds.width)
            }
            VStack{
                Spacer()
                
                Image("MateriGLB/keretaMateri")
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
                        Text("We know that 1 kilometer equals 1000 meters and 1 hour equals 3600 seconds. So, we convert the speed by multiplying 90 km/h by 1000 to get meters and then dividing by 3600 to get seconds. This gives us 25 m/s.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                        Text("Now that we have the speed in meters per second, we can find the distance traveled in 10 seconds using the formula: distance = speed × time. Here, the speed is 25 meters per second and the time is 10 seconds. So, we multiply 25 by 10 to get 250 meters")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                        Text("In conclusion, the train will travel 250 meters in 10 seconds")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                    }
                    else{
                        Text("Anna is on a train that is moving at a constant speed of 90 kilometers per hour (km/h). She looks out the window and wonders how far the train will travel in the next 10 seconds.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "374362"))
                            .padding(.bottom, 5)
                        Text("Can you help Anna calculate the distance the train will cover in this time?")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex: "374362"))
                    }
                    
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 50)
                
                
                
                //===textfield===
                if !isCorrect{
                    HStack{
                        Spacer()
                        Text("S =")
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
                            if isCorrect{
                                showMessage = false
                                
                                // unlock new item + fog (exercise case)
                                dat.isFog1 = true
                                dat.isHairStyle3Unlock = true
                                dat.checkForNewlyUnlockedItem()
                                
                                dat.ConstantAccelerationHorizontal_Material = true
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
            
            .frame(width: UIScreen.main.bounds.width - 332, height: UIScreen.main.bounds.height - 400)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ExerciseViewGLB(dat: Database())
}
