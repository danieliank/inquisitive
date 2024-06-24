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
    @Published var selectedProfileBackground: ProfileBackground?
    @Published var selectedFaceShape: FaceShape?
    @Published var selectedExpression: Expression?
    @Published var selectedHairstyle: Hairstyle?

    init(profile: Profile = Profile(),
         selectedProfileBackground: ProfileBackground? = nil,
         selectedFaceShape: FaceShape? = nil,
         selectedExpression: Expression? = nil,
         selectedHairstyle: Hairstyle? = nil) {
        self.profile = profile
        self.selectedProfileBackground = selectedProfileBackground
        self.selectedFaceShape = selectedFaceShape
        self.selectedExpression = selectedExpression
        self.selectedHairstyle = selectedHairstyle
    }
}
