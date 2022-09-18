//
//  SwiftUIPreview.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 18/09/22.
//

import SwiftUI

@available(iOS 13, *)
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController

    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    func makeUIViewController(context: Context) -> ViewController { viewController }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
}
