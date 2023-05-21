//
//  DetailsCollectionViewCell.swift
//  JustCook
//
//  Created by Apple on 21/05/2023.
//

import Foundation
import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {
    static let identifier = "DetailsCollectionViewCell"

    let scrollView: UIScrollView = {
           let scrollView = UIScrollView()
           scrollView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.isScrollEnabled = true
            scrollView.showsVerticalScrollIndicator = true
            scrollView.showsHorizontalScrollIndicator = false
            return scrollView
       
       }()
    
    
    private let instructionsHeaderLabel:  UILabel  = {
        let label =  UILabel()
        label.text = "Instructions"
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let instructionsLabel:GradientLabel = {
        let label = GradientLabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
      
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let ingredientsHeaderLabel:UILabel = {
        let label = UILabel()
        label.text = "Ingredients/Measure"
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    
    
    private let ingredientsLabel: UILabel = {
        let label =  UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let measureLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    override init(frame:CGRect) {
        super.init(frame: frame)
        configureLayout()
        
       
       
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLayout() {
        contentView.addSubview(scrollView)
        scrollView.addSubview(instructionsHeaderLabel)
        scrollView.addSubview(instructionsLabel)
        scrollView.addSubview(ingredientsHeaderLabel)
        scrollView.addSubview(ingredientsLabel)
        scrollView.addSubview(measureLabel)
       

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            instructionsHeaderLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 2),
            instructionsHeaderLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            instructionsHeaderLabel.widthAnchor.constraint(equalToConstant: 200),
            instructionsHeaderLabel.heightAnchor.constraint(equalToConstant: 50),

            instructionsLabel.topAnchor.constraint(equalTo:instructionsHeaderLabel.bottomAnchor, constant: 5),
            instructionsLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
             instructionsLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            ingredientsHeaderLabel.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 5),
            ingredientsHeaderLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            ingredientsHeaderLabel.widthAnchor.constraint(equalToConstant: 200),
            ingredientsHeaderLabel.heightAnchor.constraint(equalToConstant: 50),

            ingredientsLabel.topAnchor.constraint(equalTo:ingredientsHeaderLabel.bottomAnchor, constant: 5),
            ingredientsLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            ingredientsLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
           measureLabel.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 5),
            measureLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            measureLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            measureLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
     }

    func configure(with viewmodel:DetailsViewModel){
        instructionsLabel.text = viewmodel.strInstructions
        var ingredientMeasureString = ""
         
        // Pair 1
    
       ingredientMeasureString +=  viewmodel.strIngredient1 + viewmodel.strMeasure1
    

        // Pair 2
        if let ingredient2 = viewmodel.strIngredient2, let measure2 = viewmodel.strMeasure2 {
            ingredientMeasureString += ingredient2 + measure2
        }

        // Pair 3
        if let ingredient3 = viewmodel.strIngredient3, let measure3 = viewmodel.strMeasure3 {
            ingredientMeasureString += ingredient3 + measure3
        }

        // Pair 4
        if let ingredient4 = viewmodel.strIngredient4, let measure4 = viewmodel.strMeasure4 {
            ingredientMeasureString += ingredient4 + measure4
        }

        // Pair 5
        if let ingredient5 = viewmodel.strIngredient5, let measure5 = viewmodel.strMeasure5 {
            ingredientMeasureString += ingredient5 + measure5
        }

        // Pair 6
        if let ingredient6 = viewmodel.strIngredient6, let measure6 = viewmodel.strMeasure6 {
            ingredientMeasureString += ingredient6 + measure6
        }

        // Pair 7
        if let ingredient7 = viewmodel.strIngredient7, let measure7 = viewmodel.strMeasure7 {
            ingredientMeasureString += ingredient7 + measure7
        }

        // Pair 8
        if let ingredient8 = viewmodel.strIngredient8, let measure8 = viewmodel.strMeasure8 {
            ingredientMeasureString += ingredient8 + measure8
        }

        // Pair 9
        if let ingredient9 = viewmodel.strIngredient9, let measure9 = viewmodel.strMeasure9 {
            ingredientMeasureString += ingredient9 + measure9
        }

        // Pair 10
        if let ingredient10 = viewmodel.strIngredient10, let measure10 = viewmodel.strMeasure10 {
            ingredientMeasureString += ingredient10 + measure10
        }

        // Pair 11
        if let ingredient11 = viewmodel.strIngredient11, let measure11 = viewmodel.strMeasure11 {
            ingredientMeasureString += ingredient11 + measure11
        }

        // Pair 12
        if let ingredient12 = viewmodel.strIngredient12, let measure12 = viewmodel.strMeasure12 {
            ingredientMeasureString += ingredient12 + measure12
        }

        ingredientsLabel.text = ingredientMeasureString
    }
}
