//
//  Database.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 25/06/24.
//

import Foundation
import SwiftUI
import Combine
                                                    
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
    @Published var isHaveBadge1: Bool {
        didSet {
            UserDefaults.standard.set(isHaveBadge1, forKey: "isHaveBadge1")
        }
    }
    @Published var isHaveBadge2: Bool {
        didSet {
            UserDefaults.standard.set(isHaveBadge2, forKey: "isHaveBadge2")
        }
    }
    @Published var isHaveBadge3: Bool {
        didSet {
            UserDefaults.standard.set(isHaveBadge3, forKey: "isHaveBadge3")
        }
    }
    @Published var isHaveBadge4: Bool {
        didSet {
            UserDefaults.standard.set(isHaveBadge4, forKey: "isHaveBadge4")
        }
    }
    @Published var isHaveBadge5: Bool {
        didSet {
            UserDefaults.standard.set(isHaveBadge5, forKey: "isHaveBadge5")
        }
    }
    @Published var isHaveBadge6: Bool {
        didSet {
            UserDefaults.standard.set(isHaveBadge6, forKey: "isHaveBadge6")
        }
    }
    @Published var isHaveBadge7: Bool {
        didSet {
            UserDefaults.standard.set(isHaveBadge7, forKey: "isHaveBadge7")
        }
    }
    @Published var isHaveBadge8: Bool {
        didSet {
            UserDefaults.standard.set(isHaveBadge8, forKey: "isHaveBadge8")
        }
    }
    @Published var isHaveBadge9: Bool {
        didSet {
            UserDefaults.standard.set(isHaveBadge9, forKey: "isHaveBadge9")
        }
    }
    @Published var isHaveBadge10: Bool {
        didSet {
            UserDefaults.standard.set(isHaveBadge10, forKey: "isHaveBadge10")
        }
    }
    @Published var isHaveBadge11: Bool {
        didSet {
            UserDefaults.standard.set(isHaveBadge11, forKey: "isHaveBadge11")
        }
    }
    @Published var isHaveBadge12: Bool {
        didSet {
            UserDefaults.standard.set(isHaveBadge12, forKey: "isHaveBadge12")
        }
    }
    
    //Profile
    @Published var userName: String {
        didSet {
            UserDefaults.standard.set(userName, forKey: "userName")
        }
    }
    @Published var selectedBackgroundColor: String {
        didSet {
            UserDefaults.standard.set(selectedBackgroundColor, forKey: "selectedBackgroundColor")
        }
    }
    @Published var selectedFace: String {
        didSet {
            UserDefaults.standard.set(selectedFace, forKey: "selectedFace")
        }
    }
    @Published var selectedHairStyle: String {
        didSet {
            UserDefaults.standard.set(selectedHairStyle, forKey: "selectedHairStyle")
        }
    }
    
    @Published var isFace3Unlock: Bool {
        didSet {
            UserDefaults.standard.set(isFace3Unlock, forKey: "isFace3Unlock")
        }
    }
    @Published var isFace4Unlock: Bool {
        didSet {
            UserDefaults.standard.set(isFace4Unlock, forKey: "isFace4Unlock")
        }
    }
    @Published var isFace5Unlock: Bool {
        didSet {
            UserDefaults.standard.set(isFace5Unlock, forKey: "isFace5Unlock")
        }
    }
    @Published var isFace6Unlock: Bool {
        didSet {
            UserDefaults.standard.set(isFace6Unlock, forKey: "isFace6Unlock")
        }
    }
    
    @Published var isHairStyle3Unlock: Bool {
        didSet {
            UserDefaults.standard.set(isHairStyle3Unlock, forKey: "isHairStyle3Unlock")
        }
    }
    @Published var isHairStyle4Unlock: Bool {
        didSet {
            UserDefaults.standard.set(isHairStyle4Unlock, forKey: "isHairStyle4Unlock")
        }
    }
    @Published var isHairStyle5Unlock: Bool {
        didSet {
            UserDefaults.standard.set(isHairStyle5Unlock, forKey: "isHairStyle5Unlock")
        }
    }
    
    //Fog
    @Published var isFog1: Bool = UserDefaults.standard.bool(forKey: "isFog1") {
        didSet {
            UserDefaults.standard.set(self.isFog1, forKey: "isFog1")
        }
    }
    @Published var isFog2: Bool = UserDefaults.standard.bool(forKey: "isFog2") {
        didSet {
            UserDefaults.standard.set(self.isFog2, forKey: "isFog2")
        }
    }
    @Published var isFog3: Bool = UserDefaults.standard.bool(forKey: "isFog3") {
        didSet {
            UserDefaults.standard.set(self.isFog3, forKey: "isFog3")
        }
    }
    
    @Published var unlockedItemName: String? = nil
    @Published var showUnlockedItemPopup: Bool = false
    @Published var unlockedItems: Set<String> = [] // masih minus buat maintain data arraynya, nanti w liat lg

    func checkForNewlyUnlockedItem() {
        // Check each item and set the unlockedItemName if unlocked and not previously unlocked
        if isFace3Unlock && !unlockedItems.contains("Face3") {
            unlockedItemName = "Face3"
            showUnlockedItemPopup = true
            unlockedItems.insert("Face3")
        } else if isFace4Unlock && !unlockedItems.contains("Face4") {
            unlockedItemName = "Face4"
            showUnlockedItemPopup = true
            unlockedItems.insert("Face4")
        } else if isFace5Unlock && !unlockedItems.contains("Face5") {
            unlockedItemName = "Face5"
            showUnlockedItemPopup = true
            unlockedItems.insert("Face5")
        } else if isFace6Unlock && !unlockedItems.contains("Face6") {
            unlockedItemName = "Face6"
            showUnlockedItemPopup = true
            unlockedItems.insert("Face6")
        } else if isHairStyle3Unlock && !unlockedItems.contains("HairStyle3") {
            unlockedItemName = "HairStyle3"
            showUnlockedItemPopup = true
            unlockedItems.insert("HairStyle3")
        } else if isHairStyle4Unlock && !unlockedItems.contains("HairStyle4") {
            unlockedItemName = "HairStyle4"
            showUnlockedItemPopup = true
            unlockedItems.insert("HairStyle4")
        } else if isHairStyle5Unlock && !unlockedItems.contains("HairStyle5") {
            unlockedItemName = "HairStyle5"
            showUnlockedItemPopup = true
            unlockedItems.insert("HairStyle5")
        }
    }
    
    init() {
        self.isHaveBadge1 = UserDefaults.standard.bool(forKey: "isHaveBadge1")
        self.isHaveBadge2 = UserDefaults.standard.bool(forKey: "isHaveBadge2")
        self.isHaveBadge3 = UserDefaults.standard.bool(forKey: "isHaveBadge3")
        self.isHaveBadge4 = UserDefaults.standard.bool(forKey: "isHaveBadge4")
        self.isHaveBadge5 = UserDefaults.standard.bool(forKey: "isHaveBadge5")
        self.isHaveBadge6 = UserDefaults.standard.bool(forKey: "isHaveBadge6")
        self.isHaveBadge7 = UserDefaults.standard.bool(forKey: "isHaveBadge7")
        self.isHaveBadge8 = UserDefaults.standard.bool(forKey: "isHaveBadge8")
        self.isHaveBadge9 = UserDefaults.standard.bool(forKey: "isHaveBadge9")
        self.isHaveBadge10 = UserDefaults.standard.bool(forKey: "isHaveBadge10")
        self.isHaveBadge11 = UserDefaults.standard.bool(forKey: "isHaveBadge11")
        self.isHaveBadge12 = UserDefaults.standard.bool(forKey: "isHaveBadge12")
        
        self.userName = UserDefaults.standard.string(forKey: "userName") ?? "Your Name"
        self.selectedBackgroundColor = UserDefaults.standard.string(forKey: "selectedBackgroundColor") ?? "3E8A74"
        self.selectedFace = UserDefaults.standard.string(forKey: "selectedFace") ?? "Map/Face1"
        self.selectedHairStyle = UserDefaults.standard.string(forKey: "selectedHairStyle") ?? "Map/none"
        
        self.isFace3Unlock = UserDefaults.standard.bool(forKey: "isFace3Unlock")
        self.isFace4Unlock = UserDefaults.standard.bool(forKey: "isFace4Unlock")
        self.isFace5Unlock = UserDefaults.standard.bool(forKey: "isFace5Unlock")
        self.isFace6Unlock = UserDefaults.standard.bool(forKey: "isFace6Unlock")
        
        self.isHairStyle3Unlock = UserDefaults.standard.bool(forKey: "isHairStyle3Unlock")
        self.isHairStyle4Unlock = UserDefaults.standard.bool(forKey: "isHairStyle4Unlock")
        self.isHairStyle5Unlock = UserDefaults.standard.bool(forKey: "isHairStyle5Unlock")
        
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
            "Kinematics_Challenge": false,
            
            "isFog1": false,
            "isFog2": false,
            "isFog3": false
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
