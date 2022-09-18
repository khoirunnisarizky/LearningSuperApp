//
//  DynamicOnBoardingVC.swift
//  LearningSuperApp
//
//  Created by khoirunnisa' rizky noor fatimah on 18/09/22.
//

import UIKit

class DynamicOnBoardingVC: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let titleLbl = UILabel()
        titleLbl.text = "Hello and welcome!"
        titleLbl.font = .boldSystemFont(ofSize: 24)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        return titleLbl
    }()
    
    private lazy var bodyLabel: UILabel = {
        let bodyLbl = UILabel()
        bodyLbl.text = "Here are different options to start your journey"
        bodyLbl.translatesAutoresizingMaskIntoConstraints = false
        return bodyLbl
    }()
    
    private lazy var blueButton: UIButton = {
        let blueBtn = UIButton()
        blueBtn.backgroundColor = .blue
        blueBtn.setTitle("Blue Pill", for: .normal)
        blueBtn.tintColor = .white
        blueBtn.layer.cornerRadius = 5
        blueBtn.clipsToBounds = true
        blueBtn.translatesAutoresizingMaskIntoConstraints = false
        return blueBtn
    }()
    
    private lazy var redButton: UIButton = {
        let redBtn = UIButton()
        redBtn.backgroundColor = .red
        redBtn.setTitle("Red Pill", for: .normal)
        redBtn.tintColor = .white
        redBtn.layer.cornerRadius = 5
        redBtn.clipsToBounds = true
        redBtn.translatesAutoresizingMaskIntoConstraints = false
        return redBtn
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [redButton, blueButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel, buttonStackView])
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackView)
        setUpView()
    }
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo:view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            stackView.heightAnchor.constraint(equalToConstant: view.bounds.size.height/8)
        ])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showFirstOverlay()
    }
    
    func showFirstOverlay() {
        let overlayView = OverlayOnBoardingView(title: "This is your last chance. After this there is no turning back. You take the blue pill, the story ends; you wake up in your bed and believe whatever you want to believe.", anchorView: blueButton)
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
        let overlayView = OverlayOnBoardingView(title: "You take the red pill, you stay in Wonderland and I show you how deep the rabbit hole goes.", anchorView: redButton)
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
