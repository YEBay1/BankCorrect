//
//  mainPicker.swift
//  BankCorrectApp
//
//  Created by Yunus Emre Bayezit on 22.08.2023.
//

import SwiftUI
import Alamofire

struct mainPicker: View {
    
    @State private var animateGradient: Bool = false
    @Binding var selectedOption : Int
    @State var money = ["USD", "EUR", "JPY", "GBP", "CHF", "TRY"]
    @State var money2 = ["dollar", "euro", "yen", "sterling", "franc", "turkishlira"]
    @State private var selectedDesign = 0
    @State var selectedMoney = ""
    @Binding var price : [String]
    
    func converter() {
        price.removeAll()
        
        for i in 0...money.count - 1 {
            convert(index: i)
        }
        
        func convert(index: Int) {
            AF.request("https://api.exchangerate.host/convert?from=\(money[selectedOption])&to=\(money[index])").responseDecodable(of: model.self) { response in
                switch response.result {
                case .success(let model):
                    price.append("\(model.result)")
                case .failure(let error):

                    print("Error: \(error.localizedDescription)")
                }
            }
            
        }
    }
    
    var body: some View {
        HStack {
            Picker("Moneys", selection: $selectedOption) {
                ForEach(0..<money.count) { index in
                    Text(money[index])
                        .padding()
                        .animation(.easeInOut)
                }
                
            }
        }
        .onChange(of: selectedOption) { newValue in
            converter()
        }
        
        .pickerStyle(.segmented)
    }
}

struct mainPicker_Previews: PreviewProvider {
    static var previews: some View {
        mainPicker(selectedOption: .constant(0), price: .constant(["0"]))
    }
}
