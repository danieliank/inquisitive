//
//  MaterialViewGLB.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 19/06/24.
//

import SwiftUI
import Lottie

struct MaterialViewGLB: View {
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
            }.padding(.top, 60)
            
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
                    if currentCase > 0 && currentCase < 5{ // Show buttons only for cases 1-5
                        HStack {
                            // s button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Button(action: {
                                        // Jump to case 1 (s)
                                        currentCase = 1
                                    }) {
                                        if currentCase == 1{
                                            Text("s")
                                                .font(.system(size: 64).bold())
                                                .foregroundColor(Color(hex:"BA1A1A"))
                                        }else{
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
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Button(action: {
                                        // Jump to case 4 (v)
                                        currentCase = 4
                                    }) {
                                        if currentCase == 4 {
                                            Text("v")
                                                .font(.system(size: 64).bold())
                                                .foregroundColor(Color(hex:"BA1A1A"))
                                        }else{
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
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Button(action: {
                                        // Jump to case 2 (t)
                                        currentCase = 2
                                    }) {
                                        if currentCase == 2 {
                                            Text("t")
                                                .font(.system(size: 64).bold())
                                                .foregroundColor(Color(hex:"BA1A1A"))
                                        }else{
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
                            .padding(.bottom, 64)
                        HStack {
                            // s button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Button(action: {
                                        // Jump to case 1 (s)
                                        currentCase = 1
                                    }) {
                                        Text("s")
                                            .font(.system(size: 64).bold())
                                            .foregroundColor(Color(hex:"2A9245"))
                                    }
                                }
                            Text("=")
                                .font(.system(size: 48).bold())
                                .foregroundColor(Color(hex: "444D69"))
                            // v button
                            RoundedRectangle(cornerRadius: 24)
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
                                .overlay{
                                    Button(action: {
                                        // Jump to case 4 (v)
                                        currentCase = 4
                                    }) {
                                        Text("v")
                                            .font(.system(size: 64).bold())
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
                                .frame(width: 115, height: 115)
                                .foregroundColor(Color(hex: "EFEFEF"))
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
                }
                VStack {
                    // Show content based on currentCase
                    switch currentCase {
                    case 0:
                        Text("Linear Velocity")
                            .font(.system(size: 64).bold())
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 16)
                        Text("Did you know how things move? Can you calculate them?")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                            .padding(.bottom, 128)
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
                        Text("Did you see the box move? How did you know? You observed it within seconds as it moved a measurable **distance ( s )**. The key concept here is time. By watching the object move to a certain point over a certain period, we introduce **time (** ")
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
                        Text("The faster you move, the more distance you can cover.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                        Text("The more time you have, the more distance you can cover.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    default:
                        Text("Invalid case.")
                            .font(.system(size: 32))
                            .foregroundColor(Color(hex: "444D69"))
                    }
                }
                .multilineTextAlignment(.center)
                .padding(.vertical, 80)
                Spacer()
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
    MaterialViewGLB()
}
