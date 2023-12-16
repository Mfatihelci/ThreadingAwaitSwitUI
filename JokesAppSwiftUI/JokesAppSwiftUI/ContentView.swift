//
//  ContentView.swift
//  JokesAppSwiftUI
//
//  Created by Muhammed fatih Elçi on 16.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var jokesVM = JokesViewModel()
    
    var body: some View {
        
        NavigationView {
            List(jokesVM.jokes) { element in
                Text(element.joke)
            }
            .toolbar {
                Button(action: addJoke, label: {
                    Text("Get New Joke")
                })
            }
            .navigationTitle(Text("Jokes App"))
        }
    }
    func addJoke(){
        jokesVM.getjokes()
    }
}

#Preview {
    ContentView()
}
