//
//  LoginViewController.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 18/09/22.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {

    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        self.view.addSubview(loginView)
        setupAutoLayout()
        
    }
    
    func setupAutoLayout() {

        NSLayoutConstraint.activate([
            loginView.leftAnchor.constraint(equalTo:view.leftAnchor, constant: 20),
            loginView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            loginView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            loginView.heightAnchor.constraint(equalToConstant: view.bounds.size.height/3.3)
        ])
        
    }

}

struct LoginViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            return LoginViewController()
        }
        .previewDevice("iPhone 12")
    }
}
