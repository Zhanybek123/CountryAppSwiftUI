//
//  ListVIewVM.swift
//  CountryListSwiftUI
//
//  Created by zhanybek salgarin on 7/1/23.
//

import Foundation

class ListViewVM: ObservableObject {
    
   @Published var countriesData: [Country] = []
    
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
}
