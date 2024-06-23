//
//  SkinTone.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 20/06/24.
//

import SwiftUI
import SwiftData

class SkinTone: ObservableObject, Identifiable {
    @Published var id = UUID()
    @Published var name: String
    @Published var color: String?

    init(name: String, color: String?) {
        self.name = name
        self.color = color
    }
}
