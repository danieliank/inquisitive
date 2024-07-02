import SwiftUI

struct MapView: View {
    @State private var moveLeft1 = false
    @State private var moveLeft2 = false
    @State private var moveLeft3 = false
    @State private var isVisible = true
    @State var isPlaygroundViewPresented = false
    
    @StateObject private var dat = Database()
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background map
                Image("Map/backgroundMap")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                
                // Constant Velocity button
                NavigationLink(destination: MaterialViewGLB(dat: dat)) {
                    VStack {
                        Image("Map/train")
                            .resizable()
                            .frame(width: 788, height: 170)
                            .shadow(color:.white, radius: 12)
                        HStack {
                            Spacer()
                            Text("Constant Velocity")
                                .font(.system(size: 24).bold())
                                .foregroundColor(Color(hex: "F4FAFB"))
                                .padding(8)
                        }
                    }
                }
                .padding(.top, UIScreen.main.bounds.height * 6.5 / 10)
                .padding(.trailing, UIScreen.main.bounds.width * 12.2 / 10)
                .navigationBarHidden(true)
                
                // GLB Playground button
                NavigationLink(destination: PlaygroundView(isPresented: $isPlaygroundViewPresented, sceneName: "PlaygroundConstantVelocity", sceneClass: PlaygroundConstantVelocity.self,
                                                           onClose: {
                    dat.playgroundGLBButtonClicked = true
                })) {
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
                .offset(x: -UIScreen.main.bounds.width / 3.2, y: UIScreen.main.bounds.height * 2.3 / 10)
                .disabled(!dat.ConstantVelocity_Playground)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                
                // GLB Exercise button
                NavigationLink(destination: ExerciseViewGLB(dat: dat)) {
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
                .offset(x: -UIScreen.main.bounds.width / 2.85, y: UIScreen.main.bounds.height / 8)
                .disabled(!dat.ConstantVelocity_Exercise)
                .navigationBarHidden(true)
                
                // Constant Acceleration 1 button
                NavigationLink(destination: MaterialViewGLBB_H(dat: dat)) {
                    VStack {
                        Image("Map/car")
                            .shadow(color:.white, radius: 12)
                        HStack {
                            Text("Constant\nAcceleration 1")
                                .font(.system(size: 24).bold())
                                .foregroundColor(Color(hex: "F4FAFB"))
                        }
                    }
                }
                .padding(.bottom, UIScreen.main.bounds.height * 5 / 16)
                .padding(.trailing, UIScreen.main.bounds.width / 4)
                .disabled(!dat.ConstantAccelerationHorizontal_Material)
                .navigationBarHidden(true)
                
                // GLBB Horizontal Playground button
                NavigationLink(destination: PlaygroundView(isPresented: $isPlaygroundViewPresented, sceneName: "PlaygroundHorizontalConstantAcceleration", sceneClass: PlaygroundHorizontalConstantAcceleration.self,
                                                           onClose: {
                    dat.playgroundGLBB_HButtonClicked = true
                })) {
                    VStack {
                        ZStack {
                            Image(dat.playgroundGLBB_HButtonClicked ? "Map/playgroundButtonDone" : "Map/playgroundButton")
                            if !dat.ConstantAccelerationHorizontal_Playground {
                                Image("Map/lock")
                            }
                        }
                        Text("Playground")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "F4FAFB"))
                            .padding(.top, -12)
                    }
                }
                .offset(x: 0, y: -UIScreen.main.bounds.height * 1.2 / 10)
                .disabled(!dat.ConstantAccelerationHorizontal_Playground)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                
                // GLBB Horizontal Exercise button
                NavigationLink(destination: ExerciseViewGLBB_H(dat: dat)) {
                    VStack {
                        ZStack {
                            Image(dat.exerciseGLBB_HButtonClicked ? "Map/exerciseButtonDone" : "Map/exerciseButton")
                            if !dat.ConstantAccelerationHorizontal_Exercise {
                                Image("Map/lock")
                            }
                        }
                        Text("Exercise")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "F4FAFB"))
                            .padding(.top, -12)
                    }
                }
                .offset(x: UIScreen.main.bounds.width / 12, y: -UIScreen.main.bounds.height * 1.6 / 10)
                .disabled(!dat.ConstantAccelerationHorizontal_Exercise)
                .navigationBarHidden(true)
                
                // Constant Acceleration 2 button
                NavigationLink(destination: MaterialViewGLBB_V(dat: dat)) {
                    VStack {
                        Image("Map/coconut")
                            .shadow(color: Color(hex: "D46B29"), radius: 12)
                        HStack {
                            Text("Constant\nAccelaration 2")
                                .font(.system(size: 24).bold())
                                .foregroundColor(Color(hex: "9B822F"))
                        }
                    }
                }
                .padding(.bottom, UIScreen.main.bounds.height / 4)
                .padding(.leading, UIScreen.main.bounds.width / 2)
                .disabled(!dat.ConstantAccelerationVertical_Material)
                .navigationBarHidden(true)
                
                // GLBB Vertical Playground button
                NavigationLink(destination: PlaygroundView(isPresented: $isPlaygroundViewPresented, sceneName: "CoconutGameScene", sceneClass: CoconutGameScene.self, onClose: {
                    dat.playgroundGLBB_VButtonClicked = true
                })) {
                    VStack {
                        ZStack {
                            Image(dat.playgroundGLBB_VButtonClicked ? "Map/playgroundButtonDone" : "Map/playgroundButton")
                            if !dat.ConstantAccelerationVertical_Playground {
                                Image("Map/lock")
                            }
                        }
                        Text("Playground")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "9B822F"))
                            .padding(.top, -12)
                    }
                }
                .offset(x: UIScreen.main.bounds.width * 9 / 25, y: -UIScreen.main.bounds.height / 18)
                .disabled(!dat.ConstantAccelerationVertical_Playground)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                
                // GLBB Vertical Exercise button
                NavigationLink(destination: ExerciseViewGLBB_V(dat: dat)) {
                    VStack {
                        ZStack {
                            Image(dat.exerciseGLBB_VButtonClicked ? "Map/exerciseButtonDone" : "Map/exerciseButton")
                            if !dat.ConstantAccelerationVertical_Exercise {
                                Image("Map/lock")
                            }
                        }
                        Text("Exercise")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(hex: "9B822F"))
                            .padding(.top, -12)
                    }
                }
                .offset(x: UIScreen.main.bounds.width * 11 / 25, y: -UIScreen.main.bounds.height / 8)
                .disabled(!dat.ConstantAccelerationVertical_Exercise)
                .navigationBarHidden(true)
                
                // Just Ship button
                NavigationLink(destination: BossTransition(dat: dat)) {
                    Image("Map/ship")
                        .shadow(color:.white, radius: 6, x: 4, y: -8)
                }
                .padding(.top, UIScreen.main.bounds.height * 4.3 / 10)
                .padding(.leading, UIScreen.main.bounds.width * 23 / 40)
                .disabled(!dat.Kinematics_Challenge)
                .navigationBarHidden(true)
                
                // Monster button
                if dat.Kinematics_Challenge {
                    NavigationLink(destination: BossTransition(dat: dat)) {
                        ZStack {
                            Image("Map/seaMonster")
                                .shadow(color: .white, radius: 12)
                            Image("Map/monsterWarning")
                                .padding(.trailing, 240)
                                .padding(.top, 40)
                        }
                    }
                    .padding(.top, UIScreen.main.bounds.height * 2 / 10)
                    .padding(.trailing, UIScreen.main.bounds.width / 18)
                    .navigationBarHidden(true)
                }
                
                // Tree image
                Image("Map/coconutTree")
                    .offset(x: 4 + UIScreen.main.bounds.width / 2.5, y: 12 + UIScreen.main.bounds.height / 4)
                
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
                
                // Fog images and animations
                if !dat.isFog1 {
                    ZStack {
                        Image("Map/Cloud")
                            .resizable()
                            .scaleEffect(0.5)
                            .offset(x: moveLeft1 ? -30 : 0)
                            .animation(
                                Animation.linear(duration: 4)
                                    .repeatForever(autoreverses: true),
                                value: moveLeft1
                            )
                            .onAppear {
                                moveLeft1.toggle()
                            }
                        
                        Image("Map/lockAwan")
                        
                    }
                    .offset(x:-UIScreen.main.bounds.width/16, y:-UIScreen.main.bounds.height/6)
                    .animation(.easeOut(duration: 1), value: isVisible)
                    .onAppear {
                        isVisible = true
                        if dat.isFog1 {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                                isVisible = false
                            }
                        }
                    }
                }
                
                if !dat.isFog2 {
                    ZStack {
                        Image("Map/Cloud")
                            .offset(x: moveLeft2 ? -20 : 0)
                            .animation(
                                Animation.linear(duration: 4)
                                    .repeatForever(autoreverses: true),
                                value: moveLeft2
                            )
                            .onAppear {
                                moveLeft2.toggle()
                            }
                        
                        Image("Map/lockAwan")
                    }
                    .offset(x:UIScreen.main.bounds.width*9/23, y:-UIScreen.main.bounds.height/9)
                }
                
                if !dat.isFog3 {
                    ZStack {
                        Image("Map/Cloud")
                            .resizable()
                            .scaleEffect(0.5)
                            .offset(x: moveLeft3 ? -30 : 0)
                            .animation(
                                Animation.linear(duration: 4)
                                    .repeatForever(autoreverses: true),
                                value: moveLeft3
                            )
                            .onAppear {
                                moveLeft3.toggle()
                            }
                        
                        Image("Map/lockAwan")
                    }
                    .offset(x:UIScreen.main.bounds.width*7/25, y:UIScreen.main.bounds.height/4)
                }
                
                
                // Profile view overlay
                if dat.isProfilePressed == true {
                    ZStack {
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                dat.isProfilePressed = false
                            }
                        NewProfileView(dat:dat)
                    }
                }
                
                // Unlocked item popup
                if dat.showUnlockedItemPopup {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
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
        }
        .frame(maxWidth: 1366 * UIScreen.main.bounds.width, maxHeight: 1024 * UIScreen.main.bounds.height)
        .animation(.easeInOut, value: dat.showUnlockedItemPopup)
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    MapView()
}

