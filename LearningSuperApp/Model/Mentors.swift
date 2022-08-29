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
    
    func generateData() -> [Mentors] {
        let data = [Mentors(name: "Viona", image: "Viona", role: "Technical"),
                    Mentors(name: "Octa", image: "Octa", role: "Technical"),
                    Mentors(name: "Henri", image: "Henri", role: "Professional Growth"),
                    Mentors(name: "Phil", image: "Phil", role: "Design"),
                    Mentors(name: "John", image: "John", role: "Design"),
                    Mentors(name: "Ica", image: "Ica", role: "Design")]
        return data
    }
}

