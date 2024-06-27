//
//  MapView.swift
//  Inquisitive
//
//  Created by Felicia Himawan on 23/06/24.
//

import SwiftUI

struct MapView: View {
    @StateObject private var dat = Database()
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                //background map
                Image("Map/backgroundMap")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                
                NavigationLink(destination: MaterialViewGLB(dat: dat)){
                    VStack {
                        Image("Map/train")
                            .resizable()
                        .frame(width: 788, height: 170)
                        HStack{
                            Spacer()
                            Text("Constant Velocity")
                                .font(.system(size: 24).bold())
                                .foregroundColor(Color(hex: "F4FAFB"))
                                .padding(8)
                        }
                    }
                }
                .padding(.top, UIScreen.main.bounds.height*6.5/10)
                .padding(.trailing, UIScreen.main.bounds.width*12.2/10)
                
                //GLB playground button
                NavigationLink(destination: MaterialViewGLB(dat: dat)){
                    VStack {
                        ZStack {
                            Image(dat.playgroundGLBButtonClicked ? "Map/playgroundButtonDone" : "Map/playgroundButton")
                            if !dat.ConstantVelocity_Playground {
                                Image("Map/lock")
                            }
                        }
                        Text("Playground")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "F4FAFB"))
                            .padding(.top, -12)
                    }
                }
                .offset(x:-UIScreen.main.bounds.width/3.2, y:UIScreen.main.bounds.height*2.3/10)
                .disabled(dat.ConstantVelocity_Playground ? false : true)
                
                //GLB exercise button
                NavigationLink(destination: ExerciseViewGLB(dat: dat)){
                    VStack {
                        ZStack {
                            Image(dat.exerciseGLBButtonClicked ? "Map/exerciseButtonDone" : "Map/exerciseButton")
                            if !dat.ConstantVelocity_Playground {
                                Image("Map/lock")
                            }
                        }
                        Text("Exercise")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "F4FAFB"))
                            .padding(.top, -12)
                    }
                }
                .offset(x:-UIScreen.main.bounds.width/2.85, y:UIScreen.main.bounds.height/8)
                .disabled(dat.ConstantVelocity_Exercise ? false : true)
                
                
                // Constant Acceleration 1
                NavigationLink(destination: MaterialViewGLBB_H(dat:dat)){
                    VStack {
                        Image("Map/car")
                        HStack{
                            Text("Constant\nAcceleration 1")
                                .font(.system(size: 24).bold())
                                .foregroundColor(Color(hex: "F4FAFB"))
                        }
                    }
                }
                .padding(.bottom, UIScreen.main.bounds.height*5/16)
                .padding(.trailing, UIScreen.main.bounds.width/4)
                .disabled(dat.ConstantAccelerationHorizontal_Material ? false : true)
                
                    //GLBB Horizontal playground button
                NavigationLink(destination: MaterialViewGLBB_H(dat:dat)){
                    VStack {
                        ZStack {
                            Image(dat.playgroundGLBB_HButtonClicked ? "Map/playgroundButtonDone" : "Map/playgroundButton")
                            if !dat.ConstantAccelerationHorizontal_Playground{
                                Image("Map/lock")
                            }
                        }
                        Text("Playground")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "F4FAFB"))
                            .padding(.top, -12)
                    }
                }
                .offset(x:0, y:-UIScreen.main.bounds.height*1.2/10)
                .disabled(dat.ConstantAccelerationHorizontal_Playground ? false : true)
                
                    //GLBB Horizontal exercise button
                NavigationLink(destination: ExerciseViewGLBB_H(dat:dat)){
                    VStack {
                        ZStack {
                            Image(dat.exerciseGLBB_HButtonClicked ? "Map/exerciseButtonDone" : "Map/exerciseButton")
                            if !dat.ConstantAccelerationHorizontal_Exercise{
                                Image("Map/lock")
                            }
                        }
                        Text("Exercise")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "F4FAFB"))
                            .padding(.top, -12)
                    }
                }
                .offset(x:UIScreen.main.bounds.width/12, y:-UIScreen.main.bounds.height*1.6/10)
                .disabled(dat.ConstantAccelerationHorizontal_Exercise ? false : true)
                
                // Constant Acceleration 2
                NavigationLink(destination: MaterialViewGLBB_V(dat:dat)){
                    VStack {
                        Image("Map/coconut")
                        HStack{
                            Text("Constant\nAccelaration 2")
                                .font(.system(size: 24).bold())
                                .foregroundColor(Color(hex: "9B822F"))
                        }
                    }
                }
                .padding(.bottom, UIScreen.main.bounds.height/4)
                .padding(.leading, UIScreen.main.bounds.width/2)
                .disabled(dat.ConstantAccelerationVertical_Material ? false : true)
                
                    //GLBB Vertical playground button
                NavigationLink(destination: MaterialViewGLBB_V(dat:dat)){
                    VStack {
                        ZStack {
                            Image(dat.playgroundGLBB_VButtonClicked ? "Map/playgroundButtonDone" : "Map/playgroundButton")
                            if !dat.ConstantAccelerationVertical_Playground{
                                Image("Map/lock")
                            }
                        }
                        Text("Playground")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "9B822F"))
                            .padding(.top, -12)
                    }
                }
                .offset(x:UIScreen.main.bounds.width*9/25, y:-UIScreen.main.bounds.height/18)
                .disabled(dat.ConstantAccelerationVertical_Playground ? false : true)
                
                    //GLBB Vertical exercise button
                NavigationLink(destination: ExerciseViewGLBB_V(dat:dat)){
                    VStack {
                        ZStack {
                            Image(dat.exerciseGLBB_VButtonClicked ? "Map/exerciseButtonDone" : "Map/exerciseButton")
                            if !dat.ConstantAccelerationVertical_Exercise{
                                Image("Map/lock")
                            }
                        }
                        Text("Exercise")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "9B822F"))
                            .padding(.top, -12)
                    }
                }
                .offset(x:UIScreen.main.bounds.width*11/25, y:-UIScreen.main.bounds.height/8)
                .disabled(dat.ConstantAccelerationVertical_Exercise ? false : true)
                
                // Just ship
                NavigationLink(destination: MaterialViewGLB(dat: dat)){
//                    Image("Map/ship")
                    Button(action:{
                        withAnimation{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                dat.Kinematics_Challenge = true
                                //                        dat.Kinematics_Challenge = true
                            }
                        }
                    }){
                        Image("Map/ship")
                    }
                }
                .padding(.top, UIScreen.main.bounds.height*4.3/10)
                .padding(.leading, UIScreen.main.bounds.width*23/40)
                .disabled(dat.Kinematics_Challenge ? false : true)
                
                // Monster
                if dat.Kinematics_Challenge{
                    NavigationLink(destination: MaterialViewGLB(dat: dat)){
                        ZStack {
                            Image("Map/seaMonster")
                            Image("Map/monsterWarning")
                                .padding(.trailing, 240)
                                .padding(.top, 40)
                        }
                    }
                    .padding(.top, UIScreen.main.bounds.height*2/10)
                    .padding(.trailing, UIScreen.main.bounds.width/18)
                }
                
                //Tree .bottomTrailing
                Image("Map/coconutTree")
                    .offset(x:4+UIScreen.main.bounds.width/2.5, y:12+UIScreen.main.bounds.height/4)
                
                //Profile
                VStack{
                    HStack{
                        Button(action:{
                            dat.isProfilePressed.toggle()
                        }){
                            RoundedRectangle(cornerRadius: 40)
                                .frame(width: 120, height: 120)
                                .foregroundColor(Color(hex: "E1E8EF").opacity(0.8))
                                .shadow(radius: 24, x:2, y:4)
                                .padding()
                                .overlay{
                                    JustProfileView(dat: dat)
                                        .scaleEffect(0.3)
                                }
                        }
                        Spacer()
                    }
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                if dat.isProfilePressed == true{
                    ZStack {
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                dat.isProfilePressed = false
                            }
                        NewProfileView(dat:dat)
                    }
                }
                
                if dat.showUnlockedItemPopup {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all) // Dim background
                        .onTapGesture {
                            dat.unlockedItemName = nil
                            dat.showUnlockedItemPopup = false
                        }
                    if let itemName = dat.unlockedItemName {
                        GetItemView(itemName: itemName)
                            .padding()
                            .transition(.scale)
                            .zIndex(2)
                    }
                }
            }
            
        }.frame(maxWidth: 1366*UIScreen.main.bounds.width, maxHeight: 1024*UIScreen.main.bounds.height)
        .animation(.easeInOut, value: dat.showUnlockedItemPopup)
        .navigationViewStyle(.stack)
        .navigationBarHidden(true) // Hide the navigation bar entirely
        .navigationBarBackButtonHidden(true) // Hide the back button specifically
        .edgesIgnoringSafeArea(.all) // Ignore safe area to take full screen
        
    }
    
}

#Preview {
    MapView()
}
