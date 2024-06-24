//
//  MapView.swift
//  Inquisitive
//
//  Created by Felicia Himawan on 23/06/24.
//
import SwiftUI

struct MapView: View {
    @State private var isProfilePressed = false
    //buat ilangin animasi di NavigationLink
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
                
                //Constant Velocity
                NavigationLink(destination: MaterialViewGLB()) {
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
                NavigationLink(destination: MaterialViewGLB()) {
                    VStack {
                        ZStack {
                            Image("Map/playgroundButton")
                            Image("Map/lock")
                        }
                        Text("Playground")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "F4FAFB"))
                            .padding(.top, -12)
                    }
                }
                .offset(x:-UIScreen.main.bounds.width/3.2, y:UIScreen.main.bounds.height*2.3/10)
                
                //GLB exercise button
                NavigationLink(destination: MaterialViewGLB()) {
                    VStack {
                        ZStack {
                            Image("Map/exerciseButton")
                            Image("Map/lock")
                        }
                        Text("Exercise")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "F4FAFB"))
                            .padding(.top, -12)
                    }
                }
                .offset(x:-UIScreen.main.bounds.width/2.85, y:UIScreen.main.bounds.height/8)
                
                // Constant Acceleration 1
                NavigationLink(destination: MaterialViewGLB()) {
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
                
                    //GLBB Horizontal playground button
                NavigationLink(destination: MaterialViewGLB()) {
                    VStack {
                        ZStack {
                            Image("Map/playgroundButton")
                            Image("Map/lock")
                        }
                        Text("Playground")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "F4FAFB"))
                            .padding(.top, -12)
                    }
                }
                .offset(x:0, y:-UIScreen.main.bounds.height*1.2/10)
                
                    //GLBB Horizontal exercise button
                NavigationLink(destination: MaterialViewGLB()) {
                    VStack {
                        ZStack {
                            Image("Map/exerciseButton")
                            Image("Map/lock")
                        }
                        Text("Exercise")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "F4FAFB"))
                            .padding(.top, -12)
                    }
                }
                .offset(x:UIScreen.main.bounds.width/12, y:-UIScreen.main.bounds.height*1.6/10)
                
                // Constant Acceleration 2
                NavigationLink(destination: MaterialViewGLB()) {
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
                
                    //GLBB Vertical playground button
                NavigationLink(destination: MaterialViewGLB()) {
                    VStack {
                        ZStack {
                            Image("Map/playgroundButton")
                            Image("Map/lock")
                        }
                        Text("Playground")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "9B822F"))
                            .padding(.top, -12)
                    }
                }
                .offset(x:UIScreen.main.bounds.width*9/25, y:-UIScreen.main.bounds.height/18)
                
                    //GLBB Vertical exercise button
                NavigationLink(destination: MaterialViewGLB()) {
                    VStack {
                        ZStack {
                            Image("Map/exerciseButton")
                            Image("Map/lock")
                        }
                        Text("Exercise")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "9B822F"))
                            .padding(.top, -12)
                    }
                }
                .offset(x:UIScreen.main.bounds.width*11/25, y:-UIScreen.main.bounds.height/8)
                
                // Parabolics
                NavigationLink(destination: MaterialViewGLB()) {
                    VStack {
                        Image("Map/ship")
                        HStack{
                            Text("Parabolics")
                                .font(.system(size: 24).bold())
                                .foregroundColor(Color(hex: "F4FAFB"))
                                .padding(16)
                                .padding(.leading, 144)
                        }
                    }
                }
                .padding(.top, UIScreen.main.bounds.height*5/10)
                .padding(.leading, UIScreen.main.bounds.width*23/40)
                
                
                    //GLBB Parabolic playground button
                NavigationLink(destination: MaterialViewGLB()) {
                    VStack {
                        ZStack {
                            Image("Map/playgroundButton")
                            Image("Map/lock")
                        }
                        Text("Playground")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "F4FAFB"))
                            .padding(.top, -12)
                    }
                }
                .offset(x:UIScreen.main.bounds.width/7.5, y:UIScreen.main.bounds.height*8/20)
                
                    //GLBB Parabolic exercise button
                NavigationLink(destination: MaterialViewGLB()) {
                    VStack {
                        ZStack {
                            Image("Map/exerciseButton")
                            Image("Map/lock")
                        }
                        Text("Exercise")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "F4FAFB"))
                            .padding(.top, -12)
                    }
                }
                .offset(x:UIScreen.main.bounds.width/22, y:UIScreen.main.bounds.height*3.1/10)
                
                // Monster
                NavigationLink(destination: MaterialViewGLB()) {
                    ZStack {
                        Image("Map/seaMonster")
                        Image("Map/monsterWarning")
                            .padding(.trailing, 240)
                            .padding(.top, 40)
                    }
                }
                .padding(.top, UIScreen.main.bounds.height*2/10)
                .padding(.trailing, UIScreen.main.bounds.width/18)
                
                //Tree .bottomTrailing
                Image("Map/coconutTree")
                    .offset(x:4+UIScreen.main.bounds.width/2.5, y:12+UIScreen.main.bounds.height/4)
                
                //Profile
                VStack{
                    HStack{
                        Button(action:{
                            isProfilePressed.toggle()
                        }){
                            RoundedRectangle(cornerRadius: 40)
                                .frame(width: 120, height: 120)
                                .foregroundColor(Color(hex: "E1E8EF").opacity(0.8))
                                .shadow(radius: 24, x:2, y:4)
                                .padding()
                                .overlay{
                                    Image(systemName:"person.circle")
                                        .resizable()
                                        .frame(width: 80,height: 80)
                                        .foregroundColor(.black)
                                }
                        }
                        Spacer()
                    }
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                if isProfilePressed == true{
                    ProfileView()
                }
            }
            
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true) // Hide the navigation bar entirely
        .navigationBarBackButtonHidden(true) // Hide the back button specifically
        .edgesIgnoringSafeArea(.all) // Ignore safe area to take full screen
        
    }
    
}

#Preview {
    MapView()
}
