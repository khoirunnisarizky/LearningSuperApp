//
//  Mentors.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 29/08/22.
//

import Foundation

struct Mentors {
    var name: String?
    var image: String?
    var role: String?
    var description: String?
    
    func generateData() -> [Mentors] {
        let data = [Mentors(name: "Viona", image: "Viona", role: "Technical", description:                    "This is detail description of Viona. This is detail description of Viona.This is detail description of Viona."),
                    Mentors(name: "Octa", image: "Octa", role: "Technical", description:          "This is detail description of Octa. This is detail description of Octa.This is detail description of Octa."),
                    Mentors(name: "Henri", image: "Henri", role: "Professional Growth",           description: "This is detail description of Henri. This is detail description of Henri.This is detail description of Henri."),
                    Mentors(name: "Phil", image: "Phil", role: "Design", description: "This   is detail description of Phil. This is detail description of Phil.This is detail description of Phil."),
                    Mentors(name: "John", image: "John", role: "Design", description: "This   is detail description of John. This is detail descriptiom of John.This is detail description of John."),
                    Mentors(name: "Ica", image: "Ica", role: "Design", description: "This is  detail description of Ica. This is detail description of Ica.This is detail description of Ica.")]
        return data
    }
}

