//
//  SecondView.swift
//  BankCorrect
//
//  Created by Yunus Emre Bayezit on 17.06.2023.
//

import SwiftUI
import Alamofire

// VStack içerisindekiler bir fonksiyon içerisinde yazılabilir ve belli değerler alabilir
// Model adında bir grup oluştur ve aşağıdaki struct'ı içine ekle otomatik tanımlar zaten
// Verileri çeken bir fonksiyon ve geriye CategoryModelini dönecek ve veri çekme işlemi tek fonksiyonda halledilmiş olacak -> 17.Ders CategoryService.swift - Category.swift - ContentView.swift  -> Verileri çekme kısmı 

struct SecondView: View {
    
    @State private var animateGradient: Bool = false
    
    @State private var selectedOption = 0
    @State var money = ["USD", "EUR", "JPY", "GBP", "CHF", "TRY"]
    // "BRL", "MXN", "AUD",
    
    @State var money2 = ["dollar", "euro", "yen", "sterling", "franc", "turkishlira"]
    // "peso", "indianrupee", "brazilianreal",
    
    @State var data1 = ""
    @State var moneyName = ""
    @State var selectedMoney = ""
    @State var dict = [String: String]()
    @State var price = [String]()
    @State private var selected1 = 0
    @State var selectedMoney1 = ""
    @State var count = 0
    
    private let startColor: Color = .blue
    private let endColor: Color = .purple
    
    func converter() {
        price.removeAll()
        
        for i in 0...money.count - 1 {
            convert(index: i)
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
            }
            
        }
    }
    
    var body: some View {
        VStack {
            Picker("Moneys", selection: $selectedOption) {
                ForEach(0..<money.count) { index in
                    Text(money[index])
                    //converter()
                }
            }
            .pickerStyle(.segmented)
            
            // ---------- Dolar Kısmı -----------
            
            HStack {
                VStack {
                    Image(systemName: "\(money2[selectedOption])sign.circle")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                }
                
                VStack {
                    Text("\(money[selectedOption])")
                        .padding()
                        .font(.system(size: 30))
                }
                
                Spacer()
                
                VStack {
                    Button("Tıklayın"){
                        converter()
                    }
                }
                
                Spacer()
                
            }
            //.frame(width: 150 ,height: 50)
            .padding()
            
            Spacer()
            
            
            
            // ----------------------------------
            
            // ---------- Para Birimleri 1.Kısım -----------
            
            
            HStack(spacing: 20) {
                
                VStack {
                    HStack {
                        VStack(spacing: 5) {
                            Image(systemName: "\(money2[selectedOption])sign.circle")
                                .font(.system(size: 45))
                            
                            
                            Text("\(money[selectedOption])")
                                .font(.system(size: 24))
                            
                        }
                        
                        .padding(15)
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "dollarsign.circle")
                                .font(.system(size: 45))
                            Text("\(money[0])")
                                .font(.system(size: 24))
                            
                        }
                        Spacer()
                        
                        VStack(spacing: 5) {
                            
                            if price.count == 6 {
                                HStack {
                                    Text("\(price[0])")
                                        .font(.system(size: 30))
                                }
                            }
                            
                        }
                        Spacer()
                        
                    }
                }
                .frame(width: 340, height: 60)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.green, lineWidth: 4)
                )
            }
            
            
            HStack(spacing: 20) {
                
                VStack {
                    HStack {
                        VStack(spacing: 5) {
                            Image(systemName: "\(money2[selectedOption])sign.circle")
                                .font(.system(size: 45))
                            
                            
                            Text("\(money[selectedOption])")
                                .font(.system(size: 24))
                            
                        }
                        
                        .padding(15)
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "eurosign.circle")
                                .font(.system(size: 45))
                            Text("\(money[0])")
                                .font(.system(size: 24))
                            
                        }
                        Spacer()
                        
                        VStack(spacing: 5) {
                            
                            if price.count == 6 {
                                HStack {
                                    Text("\(price[1])")
                                        .font(.system(size: 30))
                                }
                            }
                            
                        }
                        Spacer()
                        
                    }
                }
                .frame(width: 340, height: 60)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.green, lineWidth: 4)
                )
            }
            
            
            HStack(spacing: 20) {
                
                VStack {
                    HStack {
                        VStack(spacing: 5) {
                            Image(systemName: "\(money2[selectedOption])sign.circle")
                                .font(.system(size: 45))
                            
                            
                            Text("\(money[selectedOption])")
                                .font(.system(size: 24))
                            
                        }
                        
                        .padding(15)
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "yensign.circle")
                                .font(.system(size: 45))
                            Text("\(money[0])")
                                .font(.system(size: 24))
                            
                        }
                        Spacer()
                        
                        VStack(spacing: 5) {
                            
                            if price.count == 6 {
                                HStack {
                                    Text("\(price[2])")
                                        .font(.system(size: 30))
                                }
                            }
                            
                        }
                        Spacer()
                        
                    }
                }
                .frame(width: 340, height: 60)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.green, lineWidth: 4)
                )
            }
            
            
            HStack(spacing: 20) {
                
                VStack {
                    HStack {
                        VStack(spacing: 5) {
                            Image(systemName: "\(money2[selectedOption])sign.circle")
                                .font(.system(size: 45))
                            
                            
                            Text("\(money[selectedOption])")
                                .font(.system(size: 24))
                            
                        }
                        
                        .padding(15)
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "sterlingsign.circle")
                                .font(.system(size: 45))
                            Text("\(money[0])")
                                .font(.system(size: 24))
                            
                        }
                        Spacer()
                        
                        VStack(spacing: 5) {
                            
                            if price.count == 6 {
                                HStack {
                                    Text("\(price[3])")
                                        .font(.system(size: 30))
                                }
                            }
                            
                        }
                        Spacer()
                        
                    }
                }
                .frame(width: 340, height: 60)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.green, lineWidth: 4)
                )
            }
            
            
            HStack(spacing: 20) {
                
                VStack {
                    HStack {
                        VStack(spacing: 5) {
                            Image(systemName: "\(money2[selectedOption])sign.circle")
                                .font(.system(size: 45))
                            
                            
                            Text("\(money[selectedOption])")
                                .font(.system(size: 24))
                            
                        }
                        
                        .padding(15)
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "francsign.circle")
                                .font(.system(size: 45))
                            Text("\(money[0])")
                                .font(.system(size: 24))
                            
                        }
                        Spacer()
                        
                        VStack(spacing: 5) {
                            
                            if price.count == 6 {
                                HStack {
                                    Text("\(price[4])")
                                        .font(.system(size: 30))
                                }
                            }
                            
                        }
                        Spacer()
                        
                    }
                }
                .frame(width: 340, height: 60)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.green, lineWidth: 4)
                )
            }
            
            HStack(spacing: 20) {
                
                VStack {
                    HStack {
                        VStack(spacing: 5) {
                            Image(systemName: "\(money2[selectedOption])sign.circle")
                                .font(.system(size: 45))
                            
                            
                            Text("\(money[selectedOption])")
                                .font(.system(size: 24))
                            
                        }
                        
                        .padding(15)
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "turkishlirasign.circle")
                                .font(.system(size: 45))
                            Text("\(money[0])")
                                .font(.system(size: 24))
                            
                        }
                        Spacer()
                        
                        VStack(spacing: 5) {
                            
                            if price.count == 6 {
                                HStack {
                                    Text("\(price[5])")
                                        .font(.system(size: 30))
                                }
                            }
                            
                        }
                        Spacer()
                        
                    }
                }
                .frame(width: 340, height: 60)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.green, lineWidth: 4)
                )
            }
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


struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
            .preferredColorScheme(.dark)
    }
}

struct model: Decodable {
    var result: Float = 0.0
}
