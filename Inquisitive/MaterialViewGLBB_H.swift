//
//  MaterialViewGLBB_H.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 20/06/24.
//

import SwiftUI
import Lottie

struct MaterialViewGLBB_H: View {
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
                        if currentCase < 9 {
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
                        Text("Part 1: Horizontal Motion")
                            .font(.system(size: 32).bold())
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 128)
                        Text("Have you ever notice how a car **slowly speeds up constantly** as the red light becomes green? How can we describe this change?")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 1:
                        Text("When a car is going from a red light, it starts off slow and then gradually speeds up. This steady increase in speed is an example of **constant acceleration**. Acceleration is a measure of how much an object's velocity changes over time. ")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 32)
                        Text("Observe the changes in the speedometer below. The acceleration is **5 m/s²**, meaning the velocity increases by **5 meters per second each second**. This is why the unit is expressed as **m/s²**, which is derived from **dividing meters per second ( m/s )** by seconds **( s )**.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    case 2:
                        Text("Since the velocity changes constantly, we can determine the velocity at any desired time, denoted as **v(t)**.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 32)
                        Text("See the car below! If we want to find the car's velocity at the 4th second **( t=4 )**, we calculate the **increase in velocity** and add it to the **initial velocity**.")
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
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Text("v(t)")
                                        .font(.system(size: 44).bold())
                                        .foregroundColor(Color(hex:"36B7D6"))
                                }
                            Text("=")
                                .font(.system(size: 48).bold())
                                .foregroundColor(Color(hex: "444D69"))
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Text("v(0)")
                                        .font(.system(size: 44).bold())
                                        .foregroundColor(Color(hex:"36B7D6"))
                                }
                            HStack {
                                Text("+")
                                    .font(.system(size: 48).bold())
                                    .foregroundColor(Color(hex: "444D69"))
                            }
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Text("a*t")
                                        .font(.system(size: 48).bold())
                                        .foregroundColor(Color(hex:"36B7D6"))
                                }
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
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Button(action: {
                                        // Jump to case 4 (v(t))
                                        currentCase = 4
                                    }) {
                                        Text("v(t)")
                                            .font(.system(size: 48).bold())
                                            .foregroundColor(Color(hex:"2A9245"))
                                    }
                                }
                            Text("=")
                                .font(.system(size: 48).bold())
                                .foregroundColor(Color(hex: "444D69"))
                            // v(0)
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Button(action: {
                                        // Jump to case 4 (v(t))
                                        currentCase = 4
                                    }) {
                                        Text("v(0)")
                                            .font(.system(size: 48).bold())
                                            .foregroundColor(Color(hex:"FABD20"))
                                    }
                                }
                            HStack {
                                Text("+")
                                    .font(.system(size: 48).bold())
                                    .foregroundColor(Color(hex: "444D69"))
                            }
                            // a*t
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Button(action: {
                                        // Jump to case 4 (v(t))
                                        currentCase = 4
                                    }) {
                                        Text("a*t")
                                            .font(.system(size: 48).bold())
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
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Button(action: {
                                        // Jump to case 6 (s(t))
                                        currentCase = 6
                                    }) {
                                        Text("s(t)")
                                            .font(.system(size: 48).bold())
                                            .foregroundColor(Color(hex:"2A9245"))
                                    }
                                }
                            Text("=")
                                .font(.system(size: 48).bold())
                                .foregroundColor(Color(hex: "444D69"))
                            // v(0)*t button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 180, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Button(action: {
                                        // Jump to case 7 (V(0)*t)
                                        currentCase = 7
                                    }) {
                                        Text("V(0)*t")
                                            .font(.system(size: 48).bold())
                                            .foregroundColor(Color(hex:"FABD20"))
                                    }
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
                                    Button(action: {
                                        // Jump to case 8 (1/2 a*t^2)
                                        currentCase = 8
                                    }) {
                                        Text("1/2 a*t^2")
                                            .font(.system(size: 48).bold())
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
                .padding(.top, 80)
                Spacer()
                VStack {
                    if currentCase > 5 && currentCase < 9{ // Show buttons only for cases 6,7,8
                        Spacer()
                        HStack {
                            if currentCase == 6{
                                Image("Graph_GLBB_H")
                                Spacer()
                            }
                            // s(t) button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Button(action: {
                                        // Jump to case 1 (s)
                                        currentCase = 6
                                    }) {
                                        if currentCase == 6{
                                            Text("s(t)")
                                                .font(.system(size: 48).bold())
                                                .foregroundColor(Color(hex:"BA1A1A"))
                                        }else{
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
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 180, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Button(action: {
                                        // Jump to case 7 (V(0)*t)
                                        currentCase = 7
                                    }) {
                                        if currentCase == 7 {
                                            Text("V(0)*t")
                                                .font(.system(size: 48).bold())
                                                .foregroundColor(Color(hex:"BA1A1A"))
                                        }else{
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
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 230, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Button(action: {
                                        // Jump to case 8 (1/2 a*t^2)
                                        currentCase = 8
                                    }) {
                                        if currentCase == 8 {
                                            Text("1/2 a*t^2")
                                                .font(.system(size: 48).bold())
                                                .foregroundColor(Color(hex:"BA1A1A"))
                                        }else{
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
    }
    
    // Function to calculate progress as a fraction
    func progress(for currentCase: Int) -> CGFloat {
        // 10 cases (0 to 9)
        return CGFloat(currentCase) / 9.0
    }
}

#Preview {
    MaterialViewGLBB_H()
}
