//
//  SeveralCollectionViewCell.swift
//  JustCook
//
//  Created by Apple on 21/05/2023.
//

import UIKit
import SDWebImage
class SeveralCollectionViewCell: UICollectionViewCell {
    static let identifier = "SeveralCollectionViewCell"


   private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "12")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
         imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    private let DessertLabel: GradientLabel = {
        let label = GradientLabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
    
        contentView.addSubview(imageView)
        contentView.addSubview(DessertLabel)
     
      
        configureLayout()
        
       
       
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureLayout() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 2),
            imageView.leadingAnchor.constraint(equalTo:  contentView.leadingAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.superview!.widthAnchor, multiplier: 1),
            imageView.heightAnchor.constraint(equalTo: imageView.superview!.widthAnchor, multiplier: 1.5)
            ])
        
        
        
        NSLayoutConstraint.activate([
            DessertLabel.topAnchor.constraint(equalTo:  imageView.bottomAnchor,constant: 2),
            DessertLabel.leadingAnchor.constraint(equalTo:  imageView.leadingAnchor),
            DessertLabel.trailingAnchor.constraint(equalTo:  imageView.trailingAnchor,constant: -5),
            DessertLabel.heightAnchor.constraint(equalTo:  imageView.superview!.heightAnchor, multiplier: 1/7),
        ])
       
    }
    func configure(with viewmodel:DessertHomeViewModel){
        DessertLabel.text = viewmodel.name
        imageView.sd_setImage(with: URL(string: viewmodel.image))
    }
}
