//
//  MaterialViewGLBB_H.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 20/06/24.
//

import SwiftUI
import Lottie

struct MaterialViewGLBB_H: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var dat: Database
    @State private var currentCase: Int = 0
    @State private var isClosePressed = false
    @State private var isBackPressed = false
    @State private var isNextPressed = false
    @State private var isFinishPressed = false
    
    var body: some View {
        ZStack {
            // TODO: Increase readability: for all the view inside the zstack that involved a various of stacks, consider to create a function that represent each (function of UI) view. Create an identifiable function name and let the function recieve parameters (a data or vm that holds the information the view needs to decide its behavior). Let the padding and all view positioning value to be a configurable variable consistently maintained as a single source.
            //===Animasi & images view===
            if currentCase == 0 {
                Image("MateriGLBB_H/jalanLampuMateri")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height*3/7.25)
                
                LottieView(name: "MOBIL", loopMode: .loop)
                    .frame(width: UIScreen.main.bounds.width - 800)
                    .padding(.top, UIScreen.main.bounds.height*3/7)
            }
            else if currentCase == 1{
                Image("MateriGLBB_H/mobilMateri")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height*3/7.25)
            }
            else if currentCase == 2{
                Image("MateriGLBB_H/mobilWaktuMateri1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height*3/7.25)
            }
            else if currentCase == 3{
                Image("MateriGLBB_H/mobilWaktuMateri2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height*3/7.25)
            }
            else if currentCase == 4{
                Image("MateriGLBB_H/mobilMateri2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height*3/7.25)
            }
            else if currentCase == 5{
                Image("MateriGLBB_H/mobilJarakMateri")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height*3/7.25)
            }
            else if currentCase == 7{
                Image("MateriGLBB_H/mobilKiriMateri")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height*3/7.25)
            }
            else if currentCase == 8{
                Image("MateriGLBB_H/mobilKananMateri")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height*3/7.25)
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
                    if currentCase < 9 {
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
                            dat.ConstantAccelerationHorizontal_Exercise = true
                            dat.ConstantAccelerationHorizontal_Playground = true
                            
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
                        Text("Part 1: Horizontal Motion")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 90)
                        Text("Have you ever notice how a car **slowly speeds up constantly** as the red light becomes green? How can we describe this change?")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 1:
                        Text("When a car is going from a red light, it starts off slow and then gradually speeds up. This steady increase in speed is an example of **constant acceleration**. Acceleration is a measure of how much an object's velocity changes over time. ")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 32)
                        Text("Observe the car below! The acceleration of the car is **5 m/s²**, meaning the velocity increases by **5 meters per second each second**. This is why the unit is expressed as **m/s²**, which is derived from **dividing meters per second ( m/s )** by seconds **( s )**.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 2:
                        Text("Since the velocity changes constantly, we can determine the velocity at any desired time, denoted as **v(t)**.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 32)
                        Text("If we want to find the car's velocity at the 4th second **( t=4 )**, we calculate the **increase in velocity** and add it to the **initial velocity**.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 3:
                        Text("To find the total increase in velocity at the 4th second, multiply the **acceleration ( 5 m/s² )** by the **time ( 4 seconds )**. Given that the car starts from rest, its initial velocity is 0. Thus, **the car’s velocity at the 4th second is 20 m/s**.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.top, 32)
                    case 4:
                        Text("So, to find out the car's velocity at any given time ( t ),")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        Text("we can get the formula like this:")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        
                        HStack {
                            Text("v(t)")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex:"36B7D6"))
                                .padding(.horizontal, 5)
                            Text("=")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                                .padding(.horizontal, 5)
                            Text("v(0)")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex:"36B7D6"))
                                .padding(.horizontal, 5)
                            Text("+")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                                .padding(.horizontal, 5)
                            Text("a*t")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex:"36B7D6"))
                        }
                        .padding(.vertical, 32)
                        
                        Text("Now the question is... While the car is accelerating constantly over time, **how do we calculate the distance it covers?**")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 5:
                        Text("When a car begins to move as the light turns green, its initial speed is zero. As the car accelerates, it gains speed and covers more distance. Since the speed is increasing during this acceleration.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        Text("**the distance traveled isn’t simply the product of speed and time.**")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.vertical, 32)
                        Text("This means that both the **initial speed** of the car and the **constant acceleration** play crucial roles in determining how far the car travels.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 6:
                        Text("Let’s visualize it with graphs!")
                            .font(.system(size: 36).bold())
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 48)
                        Text("To calculate the distance traveled, we look at the red area on the velocity-time graph. The total red area under the velocity curve represents the **total distance traveled**, ")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        +
                        Text("s(t)")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex:"36B7D6"))
                            .underline(true, color:Color(hex:"36B7D6"))
                        +
                        Text(". This area is what we need to find to determine the distance the car has covered.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 7:
                        Text("Firstly, ")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        +
                        Text("v(0)*t")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex:"36B7D6"))
                            .underline(true, color:Color(hex:"36B7D6"))
                        +
                        Text(" represents the initial distance traveled due to the car's starting velocity **v(0)**. This term accounts for the distance the car would cover if it maintained its initial velocity throughout the entire time **( t )**. ")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        Text("It captures the initial motion of the car from the moment it begins accelerating.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.top,32)
                    case 8:
                        Text("Secondly, ")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        +
                        Text("1/2")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex:"36B7D6"))
                            .underline(true, color:Color(hex:"36B7D6"))
                        +
                        Text(" at^2")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex:"444D69"))
                        +
                        Text(" accounts for the additional distance traveled as a result of constant acceleration **( a )** over time **( t )**. Acceleration causes the car's velocity to change continuously, and **at^2** specifically measures how much the velocity increases over time squared.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 9:
                        Text("Let’s summarize!")
                            .font(.system(size: 64).bold())
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 64)
                        Text("**To determine the velocity of a constantly accelerating car at a certain time**, we use:")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        // func v(t)
                        HStack {
                            // v(t)
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .overlay{
                                    Button(action: {
                                        // Jump to case 4 (v(t))
                                        currentCase = 4
                                    }) {
                                        Text("v(t)")
                                            .font(.system(size: 64).bold())
                                            .foregroundColor(Color(hex:"2A9245"))
                                    }
                                }
                            Text("=")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                            // v(0)
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .overlay{
                                    Button(action: {
                                        // Jump to case 4 (v(t))
                                        currentCase = 4
                                    }) {
                                        Text("v(0)")
                                            .font(.system(size: 64).bold())
                                            .foregroundColor(Color(hex:"FABD20"))
                                    }
                                }
                            HStack {
                                Text("+")
                                    .font(.system(size: 64).bold())
                                    .foregroundColor(Color(hex: "444D69"))
                            }
                            // a*t
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .overlay{
                                    Button(action: {
                                        // Jump to case 4 (v(t))
                                        currentCase = 4
                                    }) {
                                        Text("a*t")
                                            .font(.system(size: 64).bold())
                                            .foregroundColor(Color(hex:"36B7D6"))
                                    }
                                }
                        }
                        .frame(width: UIScreen.main.bounds.width-366)
                        
                        Text("**To determine the distance it travels**, we use:")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        // func s(t)
                        HStack {
                            // s(t) button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .overlay{
                                    Button(action: {
                                        // Jump to case 6 (s(t))
                                        currentCase = 6
                                    }) {
                                        Text("s(t)")
                                            .font(.system(size: 64).bold())
                                            .foregroundColor(Color(hex:"2A9245"))
                                    }
                                }
                            Text("=")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                            // v(0)*t button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 230, height: 150)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .overlay{
                                    Button(action: {
                                        // Jump to case 7 (V(0)*t)
                                        currentCase = 7
                                    }) {
                                        Text("V(0)*t")
                                            .font(.system(size: 64).bold())
                                            .foregroundColor(Color(hex:"FABD20"))
                                    }
                                }
                            HStack {
                                Text("+")
                                    .font(.system(size: 64).bold())
                                    .foregroundColor(Color(hex: "444D69"))
                            }
                            // 1/2 a*t^2 button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 330, height: 150)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .overlay{
                                    Button(action: {
                                        // Jump to case 8 (1/2 a*t^2)
                                        currentCase = 8
                                    }) {
                                        Text("1/2 a*t^2")
                                            .font(.system(size: 64).bold())
                                            .foregroundColor(Color(hex:"36B7D6"))
                                    }
                                    
                                }
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
                //=== Kotak Rumus===
                VStack {
                    if currentCase > 5 && currentCase < 9{ // Show buttons only for cases 6,7,8
                        Spacer()
                        HStack {
                            if currentCase == 6{
                                Image("MateriGLBB_H/Graph_GLBB_H")
                                Spacer()
                            }
                            // s(t) button
                            if currentCase == 6{
                                Text("s(t)")
                                    .font(.system(size: 48).bold())
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
                                            // Jump to case 6
                                            currentCase = 6
                                        }) {
                                            Text("s(t)")
                                                .font(.system(size: 48).bold())
                                                .foregroundColor(Color(hex:"36B7D6"))
                                        }
                                    }
                            }
                            
                            Text("=")
                                .font(.system(size: 48).bold())
                                .foregroundColor(Color(hex: "444D69"))
                            
                            // v(0)*t button
                            if currentCase == 7{
                                Text("V(0)*t")
                                    .font(.system(size: 48).bold())
                                    .foregroundColor(Color(hex: "BA1A1A"))
                                    .padding(.horizontal, 10)
                            }
                            else{
                                RoundedRectangle(cornerRadius: 24)
                                    .frame(width: 180, height: 115)
                                    .foregroundColor(Color(hex: "EFEFEF"))
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    .overlay{
                                        Button(action: {
                                            // Jump to case 7
                                            currentCase = 7
                                        }) {
                                            Text("V(0)*t")
                                                .font(.system(size: 48).bold())
                                                .foregroundColor(Color(hex:"36B7D6"))
                                        }
                                    }
                            }
                            
                            HStack {
                                Text("+")
                                    .font(.system(size: 48).bold())
                                    .foregroundColor(Color(hex: "444D69"))
                            }
                            
                            // 1/2 a*t^2 button
                            if currentCase == 8{
                                Text("1/2 a*t^2")
                                    .font(.system(size: 48).bold())
                                    .foregroundColor(Color(hex: "BA1A1A"))
                                    .padding(.horizontal, 10)
                            }
                            else{
                                RoundedRectangle(cornerRadius: 24)
                                    .frame(width: 230, height: 115)
                                    .foregroundColor(Color(hex: "EFEFEF"))
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    .overlay{
                                        Button(action: {
                                            // Jump to case 8
                                            currentCase = 8
                                        }) {
                                            Text("1/2 a*t^2")
                                                .font(.system(size: 48).bold())
                                                .foregroundColor(Color(hex:"36B7D6"))
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
        // 10 cases (0 to 9)
        return CGFloat(currentCase) / 9.0
    }
}

#Preview {
    MaterialViewGLBB_H(dat:Database())
}
