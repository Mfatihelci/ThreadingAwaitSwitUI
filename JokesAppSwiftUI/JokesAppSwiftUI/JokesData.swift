//
//  JokesData.swift
//  JokesAppSwiftUI
//
//  Created by Muhammed fatih Elçi on 16.12.2023.
//

import Foundation

// MARK: - Welcome
struct Welcome: Identifiable, Codable {
    let id = UUID()
    let type: String
    let value: [Value]
}
//SwiftUI kullanirken bizden identifiable ister burda kendimiz uuid siniindan verdigimizde codable etmesinde sikinti olmaz
// MARK: - Value
struct Value: Identifiable, Codable {
    let id: Int
    let joke: String
    let categories: [String]
}

// http://api.icndb.com/jokes/random
// https://raw.githubusercontent.com/atilsamancioglu/JokesAppJsonData/main/chuck.json
