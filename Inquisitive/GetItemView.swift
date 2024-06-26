//
//  GetItemView.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 26/06/24.
//

import SwiftUI

struct GetItemView: View {
    let itemName: String
//    let onClose: () -> Void

    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .foregroundColor(Color(hex: "F6F6FB"))
            .frame(width: UIScreen.main.bounds.height / 2, height: UIScreen.main.bounds.height / 2)
            .overlay {
                VStack(alignment: .center, spacing: 24) {
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .shadow(radius: 5, x: 2, y: 3)
                        .opacity(0.4)
                        Image("Map/\(itemName)")
                            .resizable()
                            .scaledToFit()
                    }
                    VStack(alignment: .center, spacing: 8) {
                        Text("Congratulations!")
                            .font(.system(size: 32).weight(.semibold))
                        Text("You have unlocked \(itemName)!")
                            .font(.system(size: 32).weight(.light))
                    }
                }
                .padding(.vertical, 64)
            }
    }
}

#Preview {
    GetItemView(itemName: "HairStyle2")
}
