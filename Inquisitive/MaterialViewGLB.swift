//
//  MaterialViewGLB.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 19/06/24.
//

import SwiftUI
import Lottie

struct MaterialViewGLB: View {
    var body: some View {
        ZStack {
            // Playground view
            VStack {
                LottieView(name: "test", loopMode: .loop)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                }
            //
            VStack {
                HStack {
                    Image("close")
                        .resizable()
                        .frame(width: 64, height: 64)
                        .padding([.top, .leading], 50)
                    Spacer()
                }
                Spacer()
                HStack{
                    Image("back")
                        .padding([.bottom, .leading], 40)
                    Spacer()
                    Image("next")
                        .padding([.bottom, .trailing], 40)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
                
            
            VStack {
                VStack{
                    HStack {
                        RoundedRectangle(cornerRadius: 24)
                            .frame(width: 115, height: 115)
                            .foregroundColor(Color(hex: "EFEFEF"))
                            .overlay{
                                Text("S")
                                    .font(.system(size: 64).bold())
                                    .foregroundColor(Color(hex:"36B7D6"))
                            }
                        Text("=")
                            .font(.system(size: 48).bold())
                            .foregroundColor(Color(hex: "444D69"))
                        RoundedRectangle(cornerRadius: 24)
                            .frame(width: 115, height: 115)
                            .foregroundColor(Color(hex: "EFEFEF"))
                            .overlay{
                                Text("V")
                                    .font(.system(size: 64).bold())
                                    .foregroundColor(Color(hex:"36B7D6"))
                            }
                        HStack {
                            Text("*")
                                .font(.system(size: 64).bold())
                                .foregroundColor(Color(hex: "444D69"))
                        }
                            .padding(.top, 32)
                        RoundedRectangle(cornerRadius: 24)
                            .frame(width: 115, height: 115)
                            .foregroundColor(Color(hex: "EFEFEF"))
                            .overlay{
                                Text("T")
                                    .font(.system(size: 64).bold())
                                    .foregroundColor(Color(hex:"36B7D6"))
                            }
                    }
                }
                VStack {
                    // ver 1
//                    Text("When objects move, they travel from one point to another, and we can measure that journey using **distance (** ")
//                        .font(.system(size: 32))
//                    +
//                    Text("s")
//                        .font(.system(size: 32).bold())
//                        .foregroundColor(Color(hex:"36B7D6"))
//                    +
//                    Text(" **)**. This **d**")
//                        .font(.system(size: 32))
//                    +
//                    Text("**is**")
//                        .font(.system(size: 32))
//                        .underline(true, color:Color(hex:"36B7D6"))
//                    +
//                    Text("**tance** tells us how far the object has traveled from its starting point to its ending point.")
//                        .font(.system(size: 32))
                    
                    // ver 2
                    Text("Did you see the box move? How did you know? You observed it within seconds as it moved a measurable **distance ( s )**. The key concept here is time. By watching the object move to a certain point over a certain period, we introduce **time (** ")
                        .font(.system(size: 32))
                    +
                    Text("t")
                        .font(.system(size: 32).bold())
                        .foregroundColor(Color(hex:"36B7D6"))
                        .underline(true, color:Color(hex:"36B7D6"))
                    +
                    Text(" **)** into the concept of linear velocity.")
                        .font(.system(size: 32))
                }
                .multilineTextAlignment(.center)
                .padding(.vertical, 80)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width-332, height: UIScreen.main.bounds.height-332)
        }
    }
}

extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0

        Scanner(string: cleanHexCode).scanHexInt64(&rgb)

        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

#Preview {
    MaterialViewGLB()
}
