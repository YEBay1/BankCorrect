//
//  MainView.swift
//  BankCorrectApp
//
//  Created by Yunus Emre Bayezit on 20.08.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            SecondView(price: [""])
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
         ThirdView()
                .tabItem {
                    Label("Converter", systemImage: "speedometer")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
