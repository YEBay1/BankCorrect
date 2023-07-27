//
//  ThirdView.swift
//  BankCorrect
//
//  Created by Yunus Emre Bayezit on 17.06.2023.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "dollarsign.square")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                Spacer()
                Text("Varlık Ekle")
            }
            .padding()
                
            HStack {
                Text("- - - - $")
                    .font(.title)
            }
            .padding(.top, 24)
            
            
            
            HStack {
                Text("Varlıklar")
                    .padding(.horizontal, 50)
                Text("Kar/Zarar")
                    .padding(.horizontal, 50)
            }
            .padding()
            .padding(.top, 20)
            
            HStack {
                Text("Dollar")
                    .padding(.horizontal, 50)
                Text("-20 dolar")
                    .padding(.horizontal, 50)
            }
            
            Spacer()
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
            .preferredColorScheme(.dark)
    }
}
