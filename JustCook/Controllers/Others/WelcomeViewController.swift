//
//  WelcomeViewController.swift
//  JustCook
//
//  Created by Apple on 20/05/2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Hungry")
        imageView.contentMode = .scaleToFill
        imageView.tintColor = .white
        imageView.layer.borderWidth = 6.0
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let welcomeButton:UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("lets eat", for: .normal)
        button.backgroundColor = .purple
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private var descriptionLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.text = "Are you Hungry"
        label.font = .systemFont(ofSize:30,weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        view.addSubview(ImageView)
        view.addSubview(welcomeButton)
        view.addSubview(descriptionLabel)
        configure()
      
        welcomeButton.addTarget(self, action: #selector(welcomeButtonTapped), for: .touchUpInside)
    }
    
    
    
        @objc func welcomeButtonTapped() {
            HapticManager.shared.vibrateForSelection()
          let vc = SiginViewController()
          let Navc = UINavigationController(rootViewController: vc)
         Navc.modalPresentationStyle = .fullScreen
           present(Navc, animated: false, completion: nil)
         }
    
    
         private func  configure() {
        NSLayoutConstraint.activate([
                    // imageView constraints
            ImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    
                    // descriptionLabel constraints
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo:view.topAnchor, constant:50),
                    
                    // welcomeButton constraints
            welcomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeButton.topAnchor.constraint(equalTo: ImageView.bottomAnchor, constant: 20),
            welcomeButton.widthAnchor.constraint(equalToConstant: 100),
            welcomeButton.heightAnchor.constraint(equalToConstant: 50)
                ])
        
        
         }


}
