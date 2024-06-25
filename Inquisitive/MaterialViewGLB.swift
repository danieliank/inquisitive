//
//  MaterialViewGLB.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 19/06/24.
//

import SwiftUI
import Lottie

struct MaterialViewGLB: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentCase: Int = 0
    @State private var isClosePressed = false
    @State private var isBackPressed = false
    @State private var isNextPressed = false
    @State private var isFinishPressed = false
    
    var body: some View {
        ZStack {
            // TODO: for every view in the zstack below, have a separate functions that return the view. give each function a contextual name that help you identify the view and the data that it holds
            //===Animasi & images view===
            Image("MateriGLB/REL")
                .frame(width: UIScreen.main.bounds.width)
                .padding(.top, UIScreen.main.bounds.height*3/4.25)
            
            if currentCase == 0{
                LottieView(name: "KERETABERPINDAH", loopMode: .loop)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 332)
                    .padding(.top, UIScreen.main.bounds.height*3/7)
            }
            else if currentCase == 1{
                Image("MateriGLB/keretaMateri")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height*3/6.25)
            }
            else if currentCase == 2{
                Image("MateriGLB/keretaWaktuMateri1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height*3/6.25)
            }
            else if currentCase == 3{
                Image("MateriGLB/keretaWaktuMateri2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height*3/6.25)
            }
            else if currentCase == 4{
                Image("MateriGLB/keretaWaktuMateri3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height*3/6.25)
            }
            else if currentCase == 5{
                LottieView(name: "KERETA", loopMode: .loop)
                    .frame(width: UIScreen.main.bounds.width - 332)
                    .padding(.top, UIScreen.main.bounds.height*3/5.75)
            }
            
            //===Progress bar===
            HStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(hex: "FFC52F"))
                    .frame(width: (UIScreen.main.bounds.width+12) * progress(for: currentCase), height: 8)
                    .padding(.bottom, UIScreen.main.bounds.height)
                Spacer()
            }
            
            //===Buttons===
            VStack {
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
                HStack{
                    if currentCase == 0 {
                        // awal ga ada back :)
                    }else{
                        Button(action: {
                            isBackPressed = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                isBackPressed = false
                            }
                            
                            // Navigate to previous case
                            if currentCase > 0 {
                                currentCase -= 1
                            }
                            
                        }) {
                            Image(isBackPressed ? "Buttons/backPressed" : "Buttons/back")
                        }
                        
                        .padding([.bottom, .leading], 40)
                    }
                    Spacer()
                    
                    if currentCase < 5 {
                        Button(action: {
                            isNextPressed = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                isNextPressed = false
                            }
                            
                            // Navigate to next case
                            currentCase += 1
                        }) {
                            Image(isNextPressed ? "Buttons/nextPressed" : "Buttons/next")
                        }
                        .padding([.bottom, .trailing], 40)
                    }
                    else{
                        Button(action: {
                            isFinishPressed = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                isFinishPressed = false
                            }
                            self.presentationMode.wrappedValue.dismiss()
                            // Navigate to map
                            
                        }) {
                            Image(isFinishPressed ? "Buttons/finishPressed" : "Buttons/finish")
                            
                        }
                        .padding([.bottom, .trailing], 40)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            //=== Kotak Rumus===
            VStack {
                VStack {
                    if currentCase > 0 && currentCase < 5{ // Show buttons only for cases 1-5
                        HStack {
                            // s button
                            if currentCase == 1{
                                Text("s")
                                    .font(.system(size: 64).bold())
                                    .foregroundColor(Color(hex: "BA1A1A"))
                                    .padding(.horizontal, 5)
                                
                            }
                            else{
                                RoundedRectangle(cornerRadius: 24)
                                    .frame(width: 115, height: 115)
                                    .foregroundColor(Color(hex: "EFEFEF"))
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    .overlay{
                                        Button(action: {
                                            // Jump to case 1 (s)
                                            currentCase = 1
                                        }) {
                                            Text("s")
                                                .font(.system(size: 64).bold())
                                                .foregroundColor(Color(hex:"36B7D6"))
                                        }
                                    }
                            }
                            Text("=")
                                .font(.system(size: 48).bold())
                                .foregroundColor(Color(hex: "444D69"))
                            // v button
                            if currentCase == 4{
                                Text("v")
                                    .font(.system(size: 64).bold())
                                    .foregroundColor(Color(hex: "BA1A1A"))
                                    .padding(.horizontal, 5)
                            }
                            else{
                                RoundedRectangle(cornerRadius: 24)
                                    .frame(width: 115, height: 115)
                                    .foregroundColor(Color(hex: "EFEFEF"))
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    .overlay{
                                        Button(action: {
                                            // Jump to case 4 (v)
                                            currentCase = 4
                                        }) {
                                            Text("v")
                                                .font(.system(size: 64).bold())
                                                .foregroundColor(Color(hex:"36B7D6"))
                                        }
                                    }
                            }
                            HStack {
                                Text("*")
                                    .font(.system(size: 64).bold())
                                    .foregroundColor(Color(hex: "444D69"))
                            }
                            .padding(.top, 32)
                            // t button
                            if currentCase == 2{
                                Text("t")
                                    .font(.system(size: 64).bold())
                                    .foregroundColor(Color(hex: "BA1A1A"))
                                    .padding(.horizontal, 5)
                            }
                            else{
                                RoundedRectangle(cornerRadius: 24)
                                    .frame(width: 115, height: 115)
                                    .foregroundColor(Color(hex: "EFEFEF"))
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    .overlay{
                                        Button(action: {
                                            // Jump to case 2 (t)
                                            currentCase = 2
                                        }) {
                                            Text("t")
                                                .font(.system(size: 64).bold())
                                                .foregroundColor(Color(hex:"36B7D6"))
                                        }
                                    }
                            }
                        }
                    }else if currentCase == 5{
                        Text("Let’s summarize!")
                            .font(.system(size: 64).bold())
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 32)
                        HStack {
                            // s button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .overlay{
                                    Button(action: {
                                        // Jump to case 1 (s)
                                        currentCase = 1
                                    }) {
                                        Text("s")
                                            .font(.system(size: 84).bold())
                                            .foregroundColor(Color(hex:"2A9245"))
                                    }
                                }
                            Text("=")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                            // v button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .overlay{
                                    Button(action: {
                                        // Jump to case 4 (v)
                                        currentCase = 4
                                    }) {
                                        Text("v")
                                            .font(.system(size: 84).bold())
                                            .foregroundColor(Color(hex:"FABD20"))
                                    }
                                }
                            HStack {
                                Text("*")
                                    .font(.system(size: 64).bold())
                                    .foregroundColor(Color(hex: "444D69"))
                            }
                            .padding(.top, 32)
                            // t button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .overlay{
                                    Button(action: {
                                        // Jump to case 2 (t)
                                        currentCase = 2
                                    }) {
                                        Text("t")
                                            .font(.system(size: 84).bold())
                                            .foregroundColor(Color(hex:"36B7D6"))
                                    }
                                }
                        }
                    }
                }
                
                //===Show content based on currentCase===
                VStack {
                    switch currentCase {
                    case 0:
                        Text("Linear Velocity")
                            .font(.system(size: 64).bold())
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 16)
                        Text("Did you know how things move? Can you calculate them?")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 100)
                        Text("Take a look at this train!")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex: "444D69"))
                    case 1:
                        Text("When objects move, they travel from one point to another, and we can measure that journey using **distance (** ")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        +
                        Text("s")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex:"36B7D6"))
                            .underline(true, color:Color(hex:"36B7D6"))
                        +
                        Text(" **)**. This **distance** tells us how far the object has traveled from its starting point to its ending point.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 2:
                        Text("Did you see the train move? How did you know? You observed it within seconds as it moved a measurable **distance ( s )**. The key concept here is time. By watching the object move to a certain point over a certain period, we introduce **time (** ")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        +
                        Text("t")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex:"36B7D6"))
                            .underline(true, color:Color(hex:"36B7D6"))
                        +
                        Text(" **)** into the concept of linear velocity.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 3:
                        Text("**Linear velocity** describes how quickly an object moves from one point to another, considering both the **distance** it covers and the **time** it takes.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 4:
                        Text("But why should you take the train in the first place? Can’t you just walk?")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 32)
                        Text("For the same **distance ( s )**, a train is faster than walking, meaning it requires less **time ( t )**. The faster you move, the less time it takes. This concept relates to **velocity (** ")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        +
                        Text("v")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex:"36B7D6"))
                            .underline(true, color:Color(hex:"36B7D6"))
                        +
                        Text(" **)**, which indicates the **distance traveled ( s )** over a certain amount of **time ( t )**.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 5:
                        VStack {
                            Text("The faster you move, the more distance you can cover.")
                                .font(.system(size: 32))
                                .foregroundColor(Color(hex: "444D69"))
                            
                            Text("The more time you have, the more distance you can cover.")
                                .font(.system(size: 32))
                                .foregroundColor(Color(hex: "444D69"))
                        }
                        .padding(.top, -16)
                    default:
                        Text("Invalid case.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    }
                }
                .multilineTextAlignment(.center)
                .padding(.vertical, 40)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 332, height: UIScreen.main.bounds.height - 332)
        }
        .navigationBarHidden(true)
    }
    
    
    // Function to calculate progress as a fraction
    func progress(for currentCase: Int) -> CGFloat {
        // 6 cases (0 to 5)
        return CGFloat(currentCase) / 5.0
    }
}

#Preview {
    MaterialViewGLB()
}
