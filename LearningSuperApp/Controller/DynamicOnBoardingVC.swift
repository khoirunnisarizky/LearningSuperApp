//
//  DynamicOnBoardingVC.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 18/09/22.
//

import UIKit

class DynamicOnBoardingVC: UIViewController {
    
    private lazy var titleLabel = ReusableLabel(labelText: "Hello and welcome!", labelType: .title)
    
    private lazy var bodyLabel = ReusableLabel(labelText: "This place is not safe. You need two weapons below to help you attack your enemy.", labelType: .subtitle)
    
    private lazy var spacer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        return view
    }()
    
    private lazy var axeButton = ReusableButton(title: "Axe", color: .blue)
    
    private lazy var gunButton: UIButton = ReusableButton(title: "Gun", color: .red)
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [gunButton, axeButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel, spacer, buttonStackView])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        setUpView()
    }
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo:view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            stackView.heightAnchor.constraint(equalToConstant: view.bounds.size.height/7)
        ])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showFirstOverlay()
    }
    
    func showFirstOverlay() {
        let overlayView = OverlayOnBoardingView(title: "This is your last chance. After this there is no turning back. You take the axe, the story ends if that is not the right moment; you wake up in your bed and believe whatever you want to believe.", anchorView: axeButton)
        overlayView.frame = view.frame
        view.addSubview(overlayView)
        
        overlayView.onTap = { [weak self, weak overlayView] in
            overlayView?.hideOverlay { _ in
                overlayView?.removeFromSuperview()
                self?.showSecondOverlay()
            }
        }
        overlayView.showOverlay()
    }
    
    func showSecondOverlay() {
        let overlayView = OverlayOnBoardingView(title: "You take the gun, you could win. But if then you stay in Wonderland and I show you how deep the rabbit hole goes.", anchorView: gunButton)
        overlayView.frame = view.frame
        view.addSubview(overlayView)
        
        overlayView.onTap = { [weak overlayView] in
            overlayView?.hideOverlay { _ in
                overlayView?.removeFromSuperview()
            }
        }
        overlayView.showOverlay()
    }
}
