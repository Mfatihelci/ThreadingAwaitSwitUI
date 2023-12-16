//
//  JokesViewModel.swift
//  JokesAppSwiftUI
//
//  Created by Muhammed fatih Elçi on 16.12.2023.
//

import Foundation
import Alamofire
// observableobjectde burdaki istedigimiz degiskenleri publis yapmak istedigimiz yayin yapabildigimiz view tarainda publis tarainda bunlari gozlemleyen gozlemci varsa view aktaracak ve viewde kendini bastan olusturucak
class JokesViewModel: ObservableObject {
    
   @Published var jokes = [Value]()
    
    init() {
        getjokes()
    }
    
    func getjokes() {
            
        AF.request("https://raw.githubusercontent.com/atilsamancioglu/JokesAppJsonData/main/chuck.json",method: .get).responseDecodable(of: Welcome.self) { response in
            
            switch response.result {
            case .success(let data):
                let value = data.value
                self.jokes += value
                //+= demek icinde varsa zaten esittir yoksa ustune ekle demek
            case .failure(let error):
                print(error)
            }
        }
    }
}
