//
//  ListVIew.swift
//  CountryListSwiftUI
//
//  Created by zhanybek salgarin on 7/1/23.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel = ListViewVM()
    
    
    var body: some View {
        
        List {
            ForEach(viewModel.countriesData, id: \.self) { country in
                NavigationLink(destination: DetailListView(city: country.name.official, subregion: country.subregion, capital: country.capital?.first ?? "No info" , flag: country.flag, currencies: country.currencies.JOD?.name ?? "No info", languages: country.languages)) {
                    ListRowView(city: country.name.official, subregion: country.subregion, capital: country.capital?.first ?? "No info" , flag: country.flag, currencies: country.currencies.JOD?.name ?? "No info", languages: country.languages)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("🎌 Countries 🎌")
                    .font(.largeTitle.bold())
                    .accessibilityAddTraits(.isHeader)
            }
        }
        .onAppear {
            viewModel.fetchData()
            print(viewModel.countriesData.count)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
    }
}


