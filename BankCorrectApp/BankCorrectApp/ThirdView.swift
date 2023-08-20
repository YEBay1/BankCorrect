//
//  ThirdView.swift
//  BankCorrect
//
//  Created by Yunus Emre Bayezit on 17.06.2023.
//

import SwiftUI
import Alamofire

// Aşağıdaki kodlar daha temiz yazılabilir. Değerleri önceki sayfadan alsam yeterli 

struct ThirdView: View {
    
    @State private var selectedOption = 0
    @State private var selectedMoney = 0
    @State var money = ["USD", "EUR", "JPY", "GBP", "MXN", "AUD", "BRL", "CHF", "TRY"]
    @State var fieldKey = ""
    @State var price = [String]()
    @State var result = 0
    @State var counter = 0
    
    @State private var animateGradient: Bool = false
    
    private let startColor: Color = .purple
    private let endColor: Color = .green
    
    var body: some View {
        VStack {
            
            Picker("Moneys", selection: $selectedOption) {
                ForEach(0..<money.count) { index in
                    Text(money[index])
                }
            }
            
            .pickerStyle(.segmented)
            
                
            HStack {
                TextField("Enter the price", text: $fieldKey)
                    .foregroundColor(.green)
                
                Text(money[selectedOption])
                    .font(.title)
            }
            .padding(.top, 24)
            
        
            HStack {
                Picker("Moneys", selection: $selectedMoney) {
                    ForEach(0..<money.count) { index in
                        Text(money[index])
                    }
                }
                .pickerStyle(.menu)
            }
            .padding()
            .padding(.top, 20)
   
            Spacer()
            
            HStack {
                Button("Tıkla"){
                    for i in 0...money.count - 1 {
                        convert(index: i)
                        counter += 1
                    }
                    
                    func convert(index: Int) {
                        AF.request("https://api.exchangerate.host/convert?from=\(money[selectedOption])&to=\(money[index])").responseDecodable(of: model.self) { response in
                            switch response.result {
                            case .success(let model):
                                // Veriyi başarıyla aldık, model içindeki verilere erişebilirsiniz.
                                //print("Result: \(model.result)")
                                price.append("\(model.result)")
                            case .failure(let error):
                                // Hata durumunda burası çalışır
                                print("Error: \(error.localizedDescription)")
                            }
                            
                            // Boş değer girince hata vericek düzeltilmeli 
                            if price.count == 9 {
                                result = 15
                                result = Int(Float(fieldKey)! * (Float(price[selectedMoney]) ?? 10))
                                price.removeAll()
                            }
                            
                            else {
                                print("Hata alındı")
                            }
                        }

                    }
                    
                     
                }
            }
            
            Spacer()
            
            HStack {
                Text("\(result)")
                
                Spacer()
                
                Text(money[selectedMoney])
                    .font(.title)
            }
            
            HStack {
                 
            }
            
            Spacer()
        }
        .foregroundColor(.black)
        .padding(.horizontal)
        .multilineTextAlignment(.center)
        .background {
            LinearGradient(colors: [startColor, endColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .hueRotation(.degrees(animateGradient ? 45 : 0))
                .onAppear {
                    withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                        animateGradient.toggle()

                    }
                }
        }
    }
    
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
            .preferredColorScheme(.dark)
    }
}
