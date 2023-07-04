//
//  ListVIewVM.swift
//  CountryListSwiftUI
//
//  Created by zhanybek salgarin on 7/1/23.
//

import Foundation
import Combine

class ListViewVM: ObservableObject {
    
    @Published var countriesData: [Country] = []
    @Published var error: CountryError?
    var cancellable = Set<AnyCancellable>()
    
    @Published var isActive: Bool
    
    let completeURL = "https://restcountries.com/v3.1/all?fields=languages,name,capital,currencies,flag,subregion"
    
    init(isActive: Bool) {
        self.isActive = isActive
        fetchData()
        //        print(countriesData.first as Any)
    }
    
    // Old way of data retreival
    /*
     func getData() {
     APIManager.shared.getCountries { [weak self] result in
     switch result {
     case .success(let success):
     DispatchQueue.main.async {
     self?.countriesData = success
     //                    print(success.count)
     }
     case .failure(let failure):
     print(failure.localizedDescription)
     }
     }
     }
     */
    
    // Combine
    func fetchData() {
        requestData(with: completeURL)
    }
    
    func requestData(with url: String) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap ({ res in
                
                // I would also add a popUp view to handle the errors
                guard let response = res.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode <= 300 else {
                    throw CountryError.invalidStatusCode
                }
                
                let decoder = JSONDecoder()
                guard let countries = try? decoder.decode([Country].self, from: res.data) else {
                    throw CountryError.failedToDecode
                }
                return countries
            })
            .sink { [weak self] res in
                switch res {
                case .failure(let error):
                    // Assigning to 'error' (published property) to pass it to popUp (AKA alertView) if I had it
                    self?.error = CountryError.custom(error: error)
                default: break
                }
            } receiveValue: { [weak self] countries in
                self?.countriesData = countries
            }
            .store(in: &cancellable)
        
    }
}

enum CountryError: Error {
    case custom(error: Error)
    case failedToDecode
    case invalidStatusCode
    
    var errorDescription: String {
        switch self {
        case .custom(let error):
            return error.localizedDescription
        case .failedToDecode:
            return "Failed to decode response"
        case .invalidStatusCode:
            return "Invalid status code"
        }
    }
}

