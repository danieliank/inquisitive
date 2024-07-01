//
//  BossTransition.swift
//  Inquisitive
//
//  Created by Felicia Himawan on 27/06/24.
//

import SwiftUI

struct BossTransition: View {
    @State private var animationCompleted = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var dat: Database
    
    var body: some View {
        
        ZStack{
            if !animationCompleted{
                LottieView(name: "kapal", loopMode: .playOnce) {
                    withAnimation(.easeIn(duration: 1.2)) {
                        animationCompleted = true
                    }
                }
                .scaledToFill()
            }
            else{
                // go to final boss page
                FinalBossView(dat: dat)
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    BossTransition( dat: Database())
}
