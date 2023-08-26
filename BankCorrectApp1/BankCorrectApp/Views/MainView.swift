//
//  MainView.swift
//  BankCorrectApp
//
//  Created by Yunus Emre Bayezit on 20.08.2023.
//


// Kutuların üstüne tıklandığında detay sayfasına gidecek -> TradingView websitesine


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
        
        .accentColor(.green)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
