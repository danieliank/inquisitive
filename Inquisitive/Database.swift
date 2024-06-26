//
//  Database.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 25/06/24.
//

import Foundation
import SwiftUI
import Combine


// TODO: remove all un-needed comments
//"ConstantVelocity_Material" : true / false -> if true, already completed
//"ConstantVelocity_Playground"
//"ConstantVelocity_Excercise"
//
//"ConstantAccelerationHorizontal_Material"
//"ConstantAccelerationHorizontal_Playground"
//"ConstantAccelerationHorizontal_Excercise"
//
//"ConstantAccelerationVertical_Material"
//"ConstantAccelerationVertical_Playground"
//"ConstantAccelerationVertical_Excercise"
//
//"Parabolic_Material"
//"Parabolic_Playground"
//"Parabolic_Excercise"
//
//"Kinematics_Challenge"
                                                    
class Database: ObservableObject {
    @Published var isProfilePressed: Bool = false
    
    @Published var ConstantVelocity_Material: Bool {
        didSet {
            UserDefaults.standard.set(ConstantVelocity_Material, forKey: "ConstantVelocity_Material")
        }
    }
    @Published var ConstantVelocity_Playground: Bool {
        didSet {
            UserDefaults.standard.set(ConstantVelocity_Playground, forKey: "ConstantVelocity_Playground")
        }
    }
    @Published var ConstantVelocity_Exercise: Bool {
        didSet {
            UserDefaults.standard.set(ConstantVelocity_Exercise, forKey: "ConstantVelocity_Exercise")
        }
    }
    
    @Published var ConstantAccelerationHorizontal_Material: Bool {
        didSet {
            UserDefaults.standard.set(ConstantAccelerationHorizontal_Material, forKey: "ConstantAccelerationHorizontal_Material")
        }
    }
    @Published var ConstantAccelerationHorizontal_Playground: Bool {
        didSet {
            UserDefaults.standard.set(ConstantAccelerationHorizontal_Playground, forKey: "ConstantAccelerationHorizontal_Playground")
        }
    }
    @Published var ConstantAccelerationHorizontal_Exercise: Bool {
        didSet {
            UserDefaults.standard.set(ConstantAccelerationHorizontal_Exercise, forKey: "ConstantAccelerationHorizontal_Exercise")
        }
    }
    
    @Published var ConstantAccelerationVertical_Material: Bool {
        didSet {
            UserDefaults.standard.set(ConstantAccelerationVertical_Material, forKey: "ConstantAccelerationVertical_Material")
        }
    }
    @Published var ConstantAccelerationVertical_Playground: Bool {
        didSet {
            UserDefaults.standard.set(ConstantAccelerationVertical_Playground, forKey: "ConstantAccelerationVertical_Playground")
        }
    }
    @Published var ConstantAccelerationVertical_Exercise: Bool {
        didSet {
            UserDefaults.standard.set(ConstantAccelerationVertical_Exercise, forKey: "ConstantAccelerationVertical_Exercise")
        }
    }
    
    @Published var Kinematics_Challenge: Bool {
        didSet {
            UserDefaults.standard.set(Kinematics_Challenge, forKey: "Kinematics_Challenge")
        }
    }
    
    @Published var playgroundGLBButtonClicked: Bool = false
    @Published var playgroundGLBB_HButtonClicked: Bool = false
    @Published var playgroundGLBB_VButtonClicked: Bool = false
    
    @Published var exerciseGLBButtonClicked: Bool = false
    @Published var exerciseGLBB_HButtonClicked: Bool = false
    @Published var exerciseGLBB_VButtonClicked: Bool = false
    
    //Badge ownership
    @Published var isHaveBadge1: Bool = false
    @Published var isHaveBadge2: Bool = false
    @Published var isHaveBadge3: Bool = false
    @Published var isHaveBadge4: Bool = false
    @Published var isHaveBadge5: Bool = false
    @Published var isHaveBadge6: Bool = false
    @Published var isHaveBadge7: Bool = false
    @Published var isHaveBadge8: Bool = false
    @Published var isHaveBadge9: Bool = false
    @Published var isHaveBadge10: Bool = false
    @Published var isHaveBadge11: Bool = false
    @Published var isHaveBadge12: Bool = false
    
    //Profile
    @Published var userName: String = "Your Name"
    @Published var selectedBackgroundColor: Color = Color(hex: "3E8A74")
    @Published var selectedFace: String = "Map/Face1"
    @Published var selectedHairStyle: String = "Map/none"
    
    @Published var isFace3Unlock: Bool = false
    @Published var isFace4Unlock: Bool = false
    @Published var isFace5Unlock: Bool = false
    @Published var isFace6Unlock: Bool = false
    
    @Published var isHairStyle3Unlock: Bool = false
    @Published var isHairStyle4Unlock: Bool = false
    @Published var isHairStyle5Unlock: Bool = false
    
    
    init() {
        // Set default values if they don't exist
        UserDefaults.standard.register(defaults: [
            "ConstantVelocity_Material": true,
            "ConstantVelocity_Playground": false,
            "ConstantVelocity_Exercise": false,
            "ConstantAccelerationHorizontal_Material": false,
            "ConstantAccelerationHorizontal_Playground": false,
            "ConstantAccelerationHorizontal_Exercise": false,
            "ConstantAccelerationVertical_Material": false,
            "ConstantAccelerationVertical_Playground": false,
            "ConstantAccelerationVertical_Exercise": false,
            "Kinematics_Challenge": false
        ])
        
        self.ConstantVelocity_Material = UserDefaults.standard.bool(forKey: "ConstantVelocity_Material")
        self.ConstantVelocity_Playground = UserDefaults.standard.bool(forKey: "ConstantVelocity_Playground")
        self.ConstantVelocity_Exercise = UserDefaults.standard.bool(forKey: "ConstantVelocity_Exercise")
        self.ConstantAccelerationHorizontal_Material = UserDefaults.standard.bool(forKey: "ConstantAccelerationHorizontal_Material")
        self.ConstantAccelerationHorizontal_Playground = UserDefaults.standard.bool(forKey: "ConstantAccelerationHorizontal_Playground")
        self.ConstantAccelerationHorizontal_Exercise = UserDefaults.standard.bool(forKey: "ConstantAccelerationHorizontal_Exercise")
        self.ConstantAccelerationVertical_Material = UserDefaults.standard.bool(forKey: "ConstantAccelerationVertical_Material")
        self.ConstantAccelerationVertical_Playground = UserDefaults.standard.bool(forKey: "ConstantAccelerationVertical_Playground")
        self.ConstantAccelerationVertical_Exercise = UserDefaults.standard.bool(forKey: "ConstantAccelerationVertical_Exercise")
        self.Kinematics_Challenge = UserDefaults.standard.bool(forKey: "Kinematics_Challenge")
        
    }
}
