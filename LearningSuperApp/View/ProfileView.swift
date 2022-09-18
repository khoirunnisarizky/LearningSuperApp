//
//  ProfileView.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 18/09/22.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewModel
    @State var presentView2: Bool = false
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: UserProfile.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \UserProfile.firstName, ascending: true),
        NSSortDescriptor(keyPath: \UserProfile.lastName, ascending: true),
        NSSortDescriptor(keyPath: \UserProfile.age, ascending: true),
        NSSortDescriptor(keyPath: \UserProfile.isShowingAge, ascending: true)
    ]) var profileData: FetchedResults<UserProfile>
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Your First Name", text: $viewModel.firstName)
                    TextField("Your Last Name", text: $viewModel.lastName)
                } header: {
                    Text("Name")
                }
                
                Section {
                    TextField("Your Age", text: $viewModel.age)
                    Toggle(isOn: $viewModel.isAgeShowing) {
                        Text("Showing Your Age?")
                    }
                } header: {
                    Text("Age")
                }
                ResultView(viewModel: viewModel)
                Button("Save") {
                    cleanData()
                    saveData(firstName: viewModel.firstName, lastName: viewModel.lastName, age: viewModel.age, isShowingAge: viewModel.isAgeShowing)
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width, height: 30)
                .foregroundColor(.blue)
                
                
                NavigationLink(isActive: $presentView2) {
                    View2()
                } label: {
                    Button("Next"){
                        presentView2.toggle()
                    }
                }
                
            }
            .navigationTitle("Profile")
            .onAppear {
                viewModel.firstName = profileData.last?.firstName ?? "Your First Name"
                viewModel.lastName = profileData.last?.lastName ?? "Your Last Name"
                viewModel.age = profileData.last?.age ?? "Your Age"
                viewModel.isAgeShowing = profileData.last?.isShowingAge ?? false
            }
            
        }
    }
    
    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
    
    func saveData(firstName: String, lastName: String, age: String, isShowingAge: Bool) {
        let newData = UserProfile(context: managedObjectContext)
        newData.firstName = firstName
        newData.lastName = lastName
        newData.age = age
        newData.isShowingAge = isShowingAge
        saveContext()
    }
    
    func cleanData() {
        for profil in profileData {
            managedObjectContext.delete(profil)
            saveContext()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileView(viewModel: ProfileViewModel())
        }
    }
}
