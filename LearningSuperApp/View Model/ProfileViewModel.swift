//
//  ProfileViewModel.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 18/09/22.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var age: String = ""
    @Published var isAgeShowing = false
    
    func stateFullName() -> String {
        "My name is \(firstName) \(lastName). "
    }
    
    func stateAge() -> String {
        isAgeShowing ? "I am \(age) years old" : ""
    }
}
