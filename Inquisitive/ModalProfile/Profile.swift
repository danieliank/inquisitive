//
//  Profile.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 20/06/24.
//

import SwiftUI
import Combine

class Profile: ObservableObject, Identifiable {
    @Published var id = UUID()
    @Published var name: String
    
    init(name: String = "John Doe") {
        self.name = name
    }
}
