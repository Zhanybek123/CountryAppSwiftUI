//
//  DetailListView.swift
//  CountryListSwiftUI
//
//  Created by zhanybek salgarin on 7/2/23.
//

import SwiftUI

struct DetailListView: View {
    let city: String
    let subregion: String
    let capital: String
    let flag: String
    let currencies: String
    let languages: [String: String]
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack(alignment: .center, spacing: 30) {
                VStack(alignment: .center) {
                    Text("City:")
                        .font(.system(size: 16, weight: .bold))
                    Text(city)
                }
                VStack {
                    Text("Flag:")
                        .font(.system(size: 16, weight: .bold))
                    Text(flag)
                        .font(.system(size: 200, weight: .bold))
                }
                VStack(alignment: .center) {
                    Text("Subregion:")
                        .font(.system(size: 16, weight: .bold))
                    Text(subregion)
                }
                HStack {
                    VStack(alignment: .center) {
                        Text("Capital:")
                            .font(.system(size: 16, weight: .bold))
                        Text(capital)
                    }
                    
                    VStack {
                        Text("Currencies:")
                            .font(.system(size: 16, weight: .bold))
                        Text(currencies)
                    }
                }
                VStack(alignment: .center) {
                    Text("Languages:")
                        .font(.system(size: 16, weight: .bold))
                    ForEach(0..<languages.values.count, id: \.self) { i in
                        Text(languages.values[languages.values.index(languages.values.startIndex, offsetBy: i)])
                    }
                }
            }
        }
            
    }
}

struct DetailListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailListView(city: "Some", subregion: "Some", capital: "Some", flag: "Some", currencies: "Some", languages: ["ss":"ff"])
    }
}
