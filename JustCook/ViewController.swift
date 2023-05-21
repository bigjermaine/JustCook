//
//  ViewController.swift
//  JustCook
//
//  Created by Apple on 20/05/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var meals = [Meal]()
    
    var homeCollectionsView: UICollectionView  = UICollectionView(frame: .zero, collectionViewLayout:UICollectionViewCompositionalLayout {sectionindex, _ -> NSCollectionLayoutSection? in
        return HomeViewController.createLayout(section: sectionindex)
    })
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.addSubview(homeCollectionsView)
        homeCollectionsView.backgroundColor = .systemBackground
            
        homeCollectionsView.dataSource = self
        homeCollectionsView.delegate = self
        
        homeCollectionsView.register(  SeveralCollectionViewCell.self, forCellWithReuseIdentifier:   SeveralCollectionViewCell.identifier)
           
        configureViewModel()
    }
    
    
    private  func configureViewModel(){
        APICaller.shared.getDesserts { result in
        DispatchQueue.main.async { [weak self] in
          switch result {
           
             case .success(let data):
                    self?.meals = data.sorted { meal1, meal2 in
                        return meal1.strMeal  < meal2.strMeal
                    }
              self?.homeCollectionsView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeCollectionsView.frame = view.bounds
    }
    
    private func configureBarButton() {
        navigationItem.rightBarButtonItem  = UIBarButtonItem(image: UIImage(systemName: "chevron.right"), style: .done, target: self, action: #selector( didTapBack))
    }
    
    
    
    @objc private func didTapBack() {
        dismiss(animated: true)
    }
    
}



extension   HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return   meals.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: SeveralCollectionViewCell.identifier, for: indexPath) as? SeveralCollectionViewCell else {
            return UICollectionViewCell()
        }
        let result = meals[indexPath.row]
        
        let viewModel = DessertHomeViewModel(name: result.strMeal  , image:  result.strMealThumb )
        cell.configure(with: viewModel)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        HapticManager.shared.vibrateForSelection()
        collectionView.deselectItem(at: indexPath, animated: true)
        let meal = meals[indexPath.row]
        let vc  =  DescriptiveCollectionViewCell(meal: meal)
        vc.title = meal.strMeal
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)

    }
   
        ///Creatinng Layout For Collection View Cell
        private static  func createLayout(section:Int) -> NSCollectionLayoutSection {
            let supplementaryViews = [
                NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment:.top)
            ]
            
            switch section {
                
            case 0:
                let item2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                
                item2.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 1, trailing: 8)
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension:.fractionalHeight(0.3)),subitem:item2,count: 3)
                
                   
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = supplementaryViews
                return section
                
                
            default:
                let item2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                
                item2.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 1, bottom: 1, trailing: 1)
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension:.fractionalWidth(0.5)),subitem:item2,count: 1)
                
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            }
        }
    
}
