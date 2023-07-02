//
//  APICalls.swift
//  CountryListSwiftUI
//
//  Created by zhanybek salgarin on 7/1/23.
//

import Foundation

enum APIError: Error {
    case failedToRetrieveData
}

class APIManager {
    
    struct Constants {
        static let completeURL = "https://restcountries.com/v3.1/all?fields=languages,name,capital,currencies,flag,subregion"
    }
    
    
    
    static let shared = APIManager()
    
    func getCountries(completion: @escaping (Result<[Country], Error>) -> Void) {
           guard let url = URL(string: Constants.completeURL) else { return }

           let session = URLSession.shared.dataTask(with: url) { data, _, error in
               guard let data = data, error == nil else {
                   completion(.failure(APIError.failedToRetrieveData))
                   return
               }
               do {
                   let result = try JSONDecoder().decode([Country].self, from: data)
                   completion(.success(result))
//                   print(result)
               } catch {
                   completion(.failure(error))
                   print("Something went wrong")
               }
           }
           session.resume()
       }
}

