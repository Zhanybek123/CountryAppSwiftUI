//
//  Country.swift
//  CountryListSwiftUI
//
//  Created by zhanybek salgarin on 7/1/23.
//

import Foundation
//
//struct CountryResults: Hashable, Codable {
//    let results: [Country]
//}
//
//struct Country: Hashable, Codable {
//
//    let flag: String
//    let name: CountryName
//    let capital: [String]
//    let subregion: String
//    let currencies: CurrencyType
//    let languages: LanguageType
//}
//
//struct CountryName: Hashable, Codable {
//    let official: String
//}
//
//struct CurrencyType: Hashable, Codable  {
//    let JOD: Currency
//
//}
//
//struct Currency: Hashable, Codable {
//    let name: String
//    let symbol: String
//}
//
//struct LanguageType: Hashable, Codable  {
//    let ara: String
//}

//struct CountryResponse: Hashable, Codable {
//    let response: CountryResults
//}
//

//struct Country: Hashable, Codable {
//    let result: [CountryResults]
//}

struct Country: Hashable, Codable {
    
    let name: Name
    let subregion: String
    let capital: [String]?
    let flag: String
    let currencies: Currencies
    let languages: [String: String]
    
    struct Name:Hashable, Codable {
        let official: String
    }
    
    struct Currencies:Hashable, Codable {
        
        let JOD: JOD?
        
        struct JOD:Hashable, Codable {
            let name: String
            let symbol: String
        }
    }
}
