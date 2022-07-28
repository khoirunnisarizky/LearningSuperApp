//
//  View2.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 27/07/22.
//

import SwiftUI

struct View2: View {
    @State var presentView3 = false
    var body: some View {
        
            VStack{
                Text("Hello, World!")
                NavigationLink(isActive: $presentView3) {
                    View3()
                } label: {
                    Button("Next view"){
                        presentView3.toggle()
                    }
                }
            }
            .navigationTitle("View 2")
        
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}

