//
//  AuthManager.swift
//  JustCook
//
//  Created by Apple on 21/05/2023.
//

import Foundation
import FirebaseAuth

class AuthManager {
    
    static let shared =  AuthManager()
    

    ///Signin
    public  func signin(email:String,password:String,completion: @escaping (Bool) -> Void ) {
        
         Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard error == nil else {
                completion(false)
                return
            }
            UserDefaults.standard.set(email, forKey: "email")
            completion(true)
           
        }
    }
    
    
    ///Signup
   public func signup(email:String,password:String,completion: @escaping (Bool) -> Void ) {
        
      Auth.auth().createUser(withEmail: email, password: password) { result, error in
                   guard error == nil else {
                   completion(false)
                return
            }
            UserDefaults.standard.set(email, forKey: "email")
            completion(true)
           
        }
    }
    //signout
    public func signout( completion: @escaping (Bool)-> Void ){
       
       do {
           try  Auth.auth().signOut()
           completion(true)
       }catch{
           completion(false)
       }
       
   }

   }
    

