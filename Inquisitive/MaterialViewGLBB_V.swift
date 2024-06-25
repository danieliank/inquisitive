//
//  MaterialViewGLBB_V.swift
//  Inquisitive
//
//  Created by Felicia Himawan on 20/06/24.
//

import SwiftUI

struct MaterialViewGLBB_V: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var dat: Database
    @State private var currentCase: Int = 0
    @State private var isClosePressed = false
    @State private var isBackPressed = false
    @State private var isNextPressed = false
    @State private var isFinishPressed = false
    
    var body: some View {
        ZStack {
            
            //===Animasi & images view===
            VStack{
                if currentCase == 0{
                    Image("MateriGLBB_V/pohonMateri")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                }
                Spacer()
                if currentCase == 0 || currentCase == 3 || currentCase == 5{
                    Image("MateriGLBB_V/sandCoconutMateri")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                }
                else if currentCase == 1{
                    Image("MateriGLBB_V/coconutJatohMateri1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                }
                else if currentCase == 2{
                    Image("MateriGLBB_V/coconutJatohMateri2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                }
                else{
                    Image("MateriGLBB_V/sandCoconutMateri")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                        .scaleEffect(x: -1, y: 1, anchor: .center)
                        
                }
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
                            // Modify map bool data
                            dat.ConstantAccelerationVertical_Exercise = true
                            dat.ConstantAccelerationVertical_Playground = true
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }) {
                            Image(isFinishPressed ? "Buttons/finishPressed" : "Buttons/finish")
                        }
                        .padding([.bottom, .trailing], 40)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            //===Show content based on currentCase===
            VStack {
                VStack {
                    switch currentCase {
                    case 0:
                        Text("Constant Acceleration")
                            .font(.system(size: 64).bold())
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 16)
                        Text("Part 2: Vertical Motion")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 80)
                        Text("How about considering an object that falls **vertically**, such as a coconut falling from a tree? Does it experience **constant acceleration** in the same way a car does when it’s moving?")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 10)
                        Text("Let’s break this down and explore the differences and similarities in these two scenarios!")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        
                    case 1:
                        Text("Vertical motion primarily involves the force of **gravity**, which involves a **constant acceleration** denoted by ")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        +
                        Text("g")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex:"36B7D6"))
                            .underline(true, color:Color(hex:"36B7D6"))
                        HStack {
                            Text("g")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex:"36B7D6"))
                                .padding(.horizontal, 5)
                            Text("=")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                                .padding(.horizontal, 5)
                            Text(" 9.8 m/s^2")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                                .padding(.horizontal, 5)
                        }
                        .padding(.vertical, 32)
                    case 2:
                        Text("When we observe a coconut falling from a tree, we can see that it **accelerates** as it gets closer to the ground. This acceleration is due to the **constant force of gravity** acting on the coconut throughout its descent.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 32)
                        Text("This example clearly illustrates how **gravity** influences **vertical motion**, causing objects to speed up as they fall towards the Earth.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 3:
                        Text("Therefore, the same formula used for horizontal velocity can be applied to vertical velocity, but with **gravity** involved, we modify it so that the **acceleration** is due to **gravity**.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 32)
                        
                        Text("Remember this formula? We covered this in last topic of the **Horizontal Motion!**")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 4:
                        Text("Take a look at the changes below! Did you notice anything?")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        Text("We used the same formula but modify to become:")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 5:
                        Text("Let’s summarize!")
                            .font(.system(size: 64).bold())
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 64)
                        Text("**To determine the velocity of a falling coconut at a certain time**, we use:")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 5)
                        // func v(t)
                        HStack {
                            // v(t)
                            Text("v(t)")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex:"2A9245"))
                                .padding(.horizontal, 5)
                            Text("=")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                                .padding(.horizontal, 5)
                            // v(0)
                            Text("v(0)")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex:"FABD20"))
                                .padding(.horizontal, 5)
                            Text("+")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                                .padding(.horizontal, 5)
                            Text("g*t")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex:"36B7D6"))
                                .padding(.horizontal, 5)
                        }
                        .frame(width: UIScreen.main.bounds.width-366)
                        .padding(.bottom, 20)
                        
                        Text("**To determine the distance it travels**, we use: ")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 5)
                        // func s(t)
                        HStack {
                            Text("s(t)")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex:"2A9245"))
                                .padding(.horizontal, 5)
                            Text("=")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                                .padding(.horizontal, 5)
                            Text("V(0)*t")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex:"FABD20"))
                            Text("+")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                                .padding(.horizontal, 5)
                            Text("1/2 g*t^2")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex:"36B7D6"))
                        }
                        .frame(width: UIScreen.main.bounds.width-366)
                        
                    default:
                        Text("Invalid case.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    }
                }
                .multilineTextAlignment(.center)
                .padding(.top, 40)
                Spacer()
                //===kotak rumus===
                VStack {
                    if currentCase > 2 && currentCase < 5{ // Show buttons only for cases 3,4
                        Spacer()
                        HStack {
                            Text("v(t)")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex:"444D69"))
                                .padding(.horizontal, 5)
                            Text("=")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                                .padding(.horizontal, 5)
                            Text("v(0)")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex:"444D69"))
                                .padding(.horizontal, 5)
                            Text("+")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                                .padding(.horizontal, 5)
                            // 1/2 a*t^2 button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .overlay{
                                    if currentCase == 3{
                                        Button(action: {
                                            currentCase = 4
                                        }) {
                                            Text("a")
                                                .font(.system(size: 64).bold())
                                                .foregroundColor(Color(hex:"36B7D6"))
                                            +
                                            Text("*t")
                                                .font(.system(size: 64).bold())
                                                .foregroundColor(Color(hex:"444D69"))
                                        }
                                        
                                    }else{
                                        Button(action: {
                                            currentCase = 3
                                        }) {
                                            Text("g")
                                                .font(.system(size: 64).bold())
                                                .foregroundColor(Color(hex:"36B7D6"))
                                            +
                                            Text("*t")
                                                .font(.system(size: 48).bold())
                                                .foregroundColor(Color(hex:"444D69"))
                                        }
                                    }
                                }
                        }
                        HStack {
                            Text("s(t)")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex:"444D69"))
                                .padding(.horizontal, 5)
                            Text("=")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                                .padding(.horizontal, 5)
                            Text("V(0)*t")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex:"444D69"))
                                .padding(.horizontal, 5)
                            Text("+")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                                .padding(.horizontal, 5)
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 330, height: 150)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .overlay{
                                    if currentCase == 3{
                                        Button(action: {
                                            currentCase = 4
                                        }) {
                                            Text("1/2")
                                                .font(.system(size: 64).bold())
                                                .foregroundColor(Color(hex:"444D69"))
                                            +
                                            Text("a")
                                                .font(.system(size: 64).bold())
                                                .foregroundColor(Color(hex:"36B7D6"))
                                            +
                                            Text("*t^2")
                                                .font(.system(size: 64).bold())
                                                .foregroundColor(Color(hex:"444D69"))
                                        }
                                    }
                                    else{
                                        Button(action: {
                                            currentCase = 3
                                        }) {
                                            Text("1/2")
                                                .font(.system(size: 64).bold())
                                                .foregroundColor(Color(hex:"444D69"))
                                            +
                                            Text("g")
                                                .font(.system(size: 64).bold())
                                                .foregroundColor(Color(hex:"36B7D6"))
                                            +
                                            Text("*t^2")
                                                .font(.system(size: 64).bold())
                                                .foregroundColor(Color(hex:"444D69"))
                                        }
                                    }
                                }
                        }
                        .frame(width: UIScreen.main.bounds.width-366)
                        Spacer()
                    }
                }
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
    MaterialViewGLBB_V(dat:Database())
}
