//
//  SaveDataService.swift
//  ADA Mini Challenge 2
//
//  Created by Ryan Kusnadi on 21/06/24.
//

import Foundation

class SaveDataService {
    static func writeData(key: String, value: Any) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func loadData<T>(key: String) -> T? {
        return UserDefaults.standard.object(forKey: key) as? T
    }
}
//TODO: delete un-needed comments
//SaveDataService.writeData(key: "ConstantVelocity_Material", value: true)
//SaveDataService.loadData(key: "ConstantVelocity_Material") -> return bool

/*
Note on progress saving -> key is string, value is boolean
 
"ConstantVelocity_Material" : true / false -> if true, already completed
"ConstantVelocity_Playground"
"ConstantVelocity_Excercise"

"ConstantAccelerationHorizontal_Material"
"ConstantAccelerationHorizontal_Playground"
"ConstantAccelerationHorizontal_Excercise"

"ConstantAccelerationVertical_Material"
"ConstantAccelerationVertical_Playground"
"ConstantAccelerationVertical_Excercise"
 
"Parabolic_Material"
"Parabolic_Playground"
"Parabolic_Excercise"
 
"Kinematics_Challenge"
*/
