//
//  DescriptiveCollectionViewCell.swift
//  JustCook
//
//  Created by Apple on 21/05/2023.
//

import UIKit

class DescriptiveCollectionViewCell:UIViewController {
    
    private var mealdeatilas = [MealDetail]()
    private var meal:Meal
    private  var viewModel =  [DetailsViewModel]()
    init(meal:Meal) {
        self.meal = meal
        super.init(nibName: nil, bundle: nil)
    }
    
    
     private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { _,_ ->
        NSCollectionLayoutSection? in
        //item
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 1.0, leading: 1.0, bottom: 1.0, trailing: 1.0)
        //group
         let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)), subitem: item,count:1)
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize:NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension:  .fractionalWidth(1.0)) , elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        ]
        return section
    }))
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = meal.strMeal
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(  TitleHeaderCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderCollectionViewCell.identifier)
      
        
        collectionView.register( DetailsCollectionViewCell.self, forCellWithReuseIdentifier:  DetailsCollectionViewCell.identifier)
      
        APICaller.shared.getallDesserts(id:meal.idMeal) { result in
           DispatchQueue.main.async { [weak self] in
               switch result {
                   
               case .success(let data):
                   self?.mealdeatilas = data
                   self?.viewModel = data.compactMap({
                       return DetailsViewModel(strInstructions: $0.strInstructions, strIngredient1: $0.strIngredient1, strIngredient2: $0.strIngredient2, strIngredient3: $0.strIngredient3, strIngredient4: $0.strIngredient4, strIngredient5: $0.strIngredient5, strIngredient6: $0.strIngredient6, strIngredient7: $0.strIngredient7, strIngredient8: $0.strIngredient8, strIngredient9: $0.strIngredient9, strIngredient10: $0.strIngredient10, strIngredient11: $0.strIngredient11, strIngredient12: $0.strIngredient12, strMeasure1: $0.strMeasure1, strMeasure2: $0.strMeasure2, strMeasure3: $0.strMeasure3, strMeasure4: $0.strMeasure4, strMeasure5: $0.strMeasure5, strMeasure6: $0.strMeasure6, strMeasure7: $0.strMeasure7, strMeasure8: $0.strMeasure8, strMeasure9: $0.strMeasure9, strMeasure10: $0.strMeasure10, strMeasure11: $0.strMeasure11, strMeasure12: $0.strMeasure12)
                     
                   })
                   self?.collectionView.reloadData()
                   print(data)
               case .failure(let error):
                   print(error.localizedDescription)
               }
           }
       }
        
    }
    

        
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
   
    
}

extension  DescriptiveCollectionViewCell: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCollectionViewCell.identifier, for: indexPath) as? DetailsCollectionViewCell else  {  return UICollectionViewCell()}
        
        cell.configure(with: viewModel[indexPath.row])
        return  cell
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
          
            let headerHeight: CGFloat = 100.0 
            let headerWidth: CGFloat = collectionView.bounds.width
            return CGSize(width: headerWidth, height: headerHeight)
        }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.count
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleHeaderCollectionViewCell.identifier, for: indexPath) as?     TitleHeaderCollectionViewCell
                       ,kind == UICollectionView.elementKindSectionHeader else {
                   return UICollectionReusableView()
               }
       header.configure(with: DessertHomeViewModel(name: meal.strMeal, image: meal.strMealThumb))
        return  header
    }
}

