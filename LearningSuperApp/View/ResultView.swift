//
//  ResultView.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 18/09/22.
//

import SwiftUI

struct ResultView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        Section {
            Text(viewModel.stateFullName() + viewModel.stateAge())
        } header: {
            Text("Result")
        }
    }
}
