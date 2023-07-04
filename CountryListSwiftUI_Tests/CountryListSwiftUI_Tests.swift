//
//  CountryListSwiftUI_Tests.swift
//  CountryListSwiftUI_Tests
//
//  Created by zhanybek salgarin on 7/3/23.
//

import XCTest
@testable import CountryListSwiftUI

final class CountryListSwiftUI_Tests: XCTestCase {
    
    var viewModel: ListViewVM?

    override func setUpWithError() throws {
        viewModel = ListViewVM(isActive: true)
    }
    
    func test_ListViewVM_isActive_shouldReturnTrue() {
        let isActive: Bool = true
        
        let vm = ListViewVM(isActive: isActive)
        
        XCTAssertEqual(vm.isActive, isActive)
    }
    
    func test_ListViewVM_completeURL_shouldBeEqual() {
        let completeURL = "https://restcountries.com/v3.1/all?fields=languages,name,capital,currencies,flag,subregion"
        
        let vm = ListViewVM(isActive: true)
        
        XCTAssertEqual(completeURL, vm.completeURL)
    }
    
    func test_ListViewVM_countriesData_shouldBeTrue() {
        let mockData = [Country(name: Country.Name(official: "Hashemite Kingdom of Jordan"), subregion: "Western Asia", capital: ["Amman"], flag: "🇯🇴", currencies: Country.Currencies(JOD: Country.Currencies.JOD.init(name: "Jordanian dinar", symbol: "د.ا")), languages: ["ara": "Arabic"])]
        
        let vm = ListViewVM(isActive: true)
        vm.fetchData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(vm.countriesData, mockData)
        }
        
    }

}
