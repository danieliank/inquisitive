//
//  ProfileConfiguration.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 20/06/24.
//

import SwiftUI
import Combine

@MainActor
class ProfileConfiguration: ObservableObject, Identifiable {
    @Published var profile: Profile
    @Published var selectedSkinTone: SkinTone?
    @Published var selectedFaceShape: FaceShape?
    @Published var selectedExpression: Expression?
    @Published var selectedHairstyle: Hairstyle?

    init(profile: Profile = Profile(),
         selectedSkinTone: SkinTone? = nil,
         selectedFaceShape: FaceShape? = nil,
         selectedExpression: Expression? = nil,
         selectedHairstyle: Hairstyle? = nil) {
        self.profile = profile
        self.selectedSkinTone = selectedSkinTone
        self.selectedFaceShape = selectedFaceShape
        self.selectedExpression = selectedExpression
        self.selectedHairstyle = selectedHairstyle
    }
}
