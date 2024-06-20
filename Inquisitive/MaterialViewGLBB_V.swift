//
//  MaterialViewGLBB_V.swift
//  Inquisitive
//
//  Created by Felicia Himawan on 20/06/24.
//

import SwiftUI

struct MaterialViewGLBB_V: View {
    @State private var currentCase: Int = 0
    
    var body: some View {
        ZStack {
            // Playground view
            VStack {
                LottieView(name: ".", loopMode: .loop)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            }
            
            // Progress bar
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: UIScreen.main.bounds.width/2, height: 24)
                    .foregroundColor(.white)
                    .shadow(radius: 5, x: 1, y: 2)
                    .overlay{
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color(hex: "E2E2E2"))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 4)
                            // Indicator progress
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color(hex: "FFC52F"))
                                .frame(width: (UIScreen.main.bounds.width/2 - 12) * progress(for: currentCase))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 4)
                        }
                    }
                Spacer()
            }
            .padding(.top, 60)
            
            VStack {
                HStack {
                    Button(action:{
                        // back to menu (keluar)
                    }){
                        Image("close")
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
                            // Navigate to previous case
                            if currentCase > 0 {
                                currentCase -= 1
                            }
                        }) {
                            Image("back")
                        }
                        .padding([.bottom, .leading], 40)
                    }
                    Spacer()
                    Button(action: {
                        // Navigate to next case
                        if currentCase < 5 {
                            currentCase += 1
                        }
                    }) {
                        Image("next")
                    }
                    .padding([.bottom, .trailing], 40)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack {
                VStack {
                    // Show content based on currentCase
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
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Text("g")
                                        .font(.system(size: 44).bold())
                                        .foregroundColor(Color(hex:"36B7D6"))
                                }
                            Text("=")
                                .font(.system(size: 48).bold())
                                .foregroundColor(Color(hex: "444D69"))
                            
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 300, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Text(" 9.8 m/s^2")
                                        .font(.system(size: 44).bold())
                                        .foregroundColor(Color(hex: "444D69"))
                                }
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
                        // func v(t)
                        HStack {
                            // v(t)
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Text("v(t)")
                                        .font(.system(size: 48).bold())
                                        .foregroundColor(Color(hex:"2A9245"))
                                }
                            Text("=")
                                .font(.system(size: 48).bold())
                                .foregroundColor(Color(hex: "444D69"))
                            // v(0)
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Text("v(0)")
                                        .font(.system(size: 48).bold())
                                        .foregroundColor(Color(hex:"FABD20"))
                                }
                            HStack {
                                Text("+")
                                    .font(.system(size: 48).bold())
                                    .foregroundColor(Color(hex: "444D69"))
                            }
                            // g*t
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Text("g*t")
                                        .font(.system(size: 48).bold())
                                        .foregroundColor(Color(hex:"36B7D6"))
                                }
                        }
                        .frame(width: UIScreen.main.bounds.width-366)
                        
                        Text("**To determine the distance it travels**, we use: ")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        // func s(t)
                        HStack {
                            // s(t) button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Text("s(t)")
                                        .font(.system(size: 48).bold())
                                        .foregroundColor(Color(hex:"2A9245"))
                                }
                            Text("=")
                                .font(.system(size: 48).bold())
                                .foregroundColor(Color(hex: "444D69"))
                            // v(0)*t button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 180, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Text("V(0)*t")
                                        .font(.system(size: 48).bold())
                                        .foregroundColor(Color(hex:"FABD20"))
                                }
                            HStack {
                                Text("+")
                                    .font(.system(size: 48).bold())
                                    .foregroundColor(Color(hex: "444D69"))
                            }
                            // 1/2 a*t^2 button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 230, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Text("1/2 g*t^2")
                                        .font(.system(size: 48).bold())
                                        .foregroundColor(Color(hex:"36B7D6"))
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
                .padding(.top, 80)
                Spacer()
                VStack {
                    if currentCase > 2 && currentCase < 5{ // Show buttons only for cases 3,4
                        Spacer()
                        HStack {
                            // v(t) button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Text("v(t)")
                                        .font(.system(size: 48).bold())
                                        .foregroundColor(Color(hex:"444D69"))
                                }
                            Text("=")
                                .font(.system(size: 48).bold())
                                .foregroundColor(Color(hex: "444D69"))
                            // v(0) button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Text("v(0)")
                                        .font(.system(size: 48).bold())
                                        .foregroundColor(Color(hex:"444D69"))
                                    
                                }
                            HStack {
                                Text("+")
                                    .font(.system(size: 48).bold())
                                    .foregroundColor(Color(hex: "444D69"))
                            }
                            // 1/2 a*t^2 button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    if currentCase == 3{
                                        Text("a")
                                            .font(.system(size: 48).bold())
                                            .foregroundColor(Color(hex:"36B7D6"))
                                        +
                                        Text("*t")
                                            .font(.system(size: 48).bold())
                                            .foregroundColor(Color(hex:"444D69"))
                                    }else{
                                        Text("g")
                                            .font(.system(size: 48).bold())
                                            .foregroundColor(Color(hex:"36B7D6"))
                                        +
                                        Text("*t")
                                            .font(.system(size: 48).bold())
                                            .foregroundColor(Color(hex:"444D69"))
                                    }
                                }
                        }
                        
                        
                        HStack {
                            
                            // s(t) button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Text("s(t)")
                                        .font(.system(size: 48).bold())
                                        .foregroundColor(Color(hex:"444D69"))
                                    
                                }
                            Text("=")
                                .font(.system(size: 48).bold())
                                .foregroundColor(Color(hex: "444D69"))
                            // v(0)*t button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 180, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Text("V(0)*t")
                                        .font(.system(size: 48).bold())
                                        .foregroundColor(Color(hex:"444D69"))
                                    
                                }
                            HStack {
                                Text("+")
                                    .font(.system(size: 48).bold())
                                    .foregroundColor(Color(hex: "444D69"))
                            }
                            // 1/2 a*t^2 button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 230, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    if currentCase == 3{
                                        Text("1/2")
                                            .font(.system(size: 48).bold())
                                            .foregroundColor(Color(hex:"444D69"))
                                        +
                                        Text("a")
                                            .font(.system(size: 48).bold())
                                            .foregroundColor(Color(hex:"36B7D6"))
                                        +
                                        Text("*t^2")
                                            .font(.system(size: 48).bold())
                                            .foregroundColor(Color(hex:"444D69"))
                                        
                                    }
                                    else{
                                        Text("1/2")
                                            .font(.system(size: 48).bold())
                                            .foregroundColor(Color(hex:"444D69"))
                                        +
                                        Text("g")
                                            .font(.system(size: 48).bold())
                                            .foregroundColor(Color(hex:"36B7D6"))
                                        +
                                        Text("*t^2")
                                            .font(.system(size: 48).bold())
                                            .foregroundColor(Color(hex:"444D69"))
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
    }
    
    // Function to calculate progress as a fraction
    func progress(for currentCase: Int) -> CGFloat {
        // 6 cases (0 to 5)
        return CGFloat(currentCase) / 5.0
    }
    
}

#Preview {
    MaterialViewGLBB_V()
}
