//
//  Expression.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 20/06/24.
//

import SwiftUI
import SwiftData

class Expression: ObservableObject, Identifiable {
    @Published var id = UUID()
    @Published var name: String
    @Published var imageName: String // Name of image asset

    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}
