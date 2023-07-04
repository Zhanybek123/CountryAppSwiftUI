//
//  ListRowVIew.swift
//  CountryListSwiftUI
//
//  Created by zhanybek salgarin on 7/1/23.
//

import SwiftUI

struct ListRowView: View {
    
    let city: String
    let subregion: String
    let capital: String
    let flag: String
    let currencies: String
    let languages: [String: String]
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading) {
                    Text("City:")
                        .font(.system(size: 16, weight: .bold))
                    Text(city)
                }
                VStack(alignment: .leading) {
                    Text("Subregion:")
                        .font(.system(size: 16, weight: .bold))
                    Text(subregion)
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text("Capital:")
                            .font(.system(size: 16, weight: .bold))
                        Text(capital)
                    }
                    VStack {
                        Text("Flag:")
                            .font(.system(size: 16, weight: .bold))
                        Text(flag)
                    }
                    VStack {
                        Text("Currencies:")
                            .font(.system(size: 16, weight: .bold))
                        Text(currencies)
                    }
                }
                VStack(alignment: .leading) {
                    Text("Languages:")
                        .font(.system(size: 16, weight: .bold))
                    ForEach(0..<languages.values.count, id: \.self) { i in
                        createTextViewFromDictionary(valueIndex: i)
                    }
                }
            }
        }
    }
    private func createTextViewFromDictionary (valueIndex count: Int) -> Text {
        return Text(languages.values[languages.values.index(languages.values.startIndex, offsetBy: count)])
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(city: "Some", subregion: "Some", capital: "Some", flag: "Some", currencies: "Some", languages: ["ss":"ff"])
    }
}
