//
//  NetworkManager.swift
//  JustCook
//
//  Created by Apple on 21/05/2023.
//

import Foundation

class APICaller {
    
    static let shared = APICaller()
    struct Constants {
    static let baseaAPIURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    static let baseaAPIURL2 = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    }
   
    

    
    private init() {}
    
    enum APIError:Error {
        case failedToGetData
    }
    
    
    ///API Caller
    public func getDesserts(completion:@escaping(Result< [Meal], Error>)-> Void) {
        
        guard let url = URL(string:Constants.baseaAPIURL) else {return }
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            guard let data = data , error == nil else {
                completion(.failure(APIError.failedToGetData))
                return}
            do {
                
            let result = try JSONDecoder().decode(MealModel.self, from: data)
            completion(.success(result.meals))
                
      //            let json = try JSONSerialization.jsonObject(with: data,options:           .allowFragments)
      //            print(json)

            }catch{
                print(error.localizedDescription)
                completion(.failure(APIError.failedToGetData))
            }
        }
       task.resume()
    }
    
    
    ///API Caller
    public func getallDesserts(id:String, completion:@escaping(Result<[MealDetail], Error>)-> Void) {
        
        guard let url = URL(string:"\(Constants.baseaAPIURL2)\(id)") else {return }
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            guard let data = data , error == nil else {
                completion(.failure(APIError.failedToGetData))
                return}
            do {
                
            let result = try JSONDecoder().decode(MealData.self, from: data)
                completion(.success(result.meals))
                
      //            let json = try JSONSerialization.jsonObject(with: data,options:           .allowFragments)
      //            print(json)

            }catch{
                print(error.localizedDescription)
                completion(.failure(APIError.failedToGetData))
            }
        }
       task.resume()
    }
}
