//
//  SecondView.swift
//  BankCorrect
//
//  Created by Yunus Emre Bayezit on 17.06.2023.
//

import SwiftUI
import Alamofire

struct SecondView: View {
    @State private var selectedOption = 0
    @State var money = ["USD", "EUR", "JPY", "GBP", "MXN", "AUD", "BRL", "CHF", "TRY"]
    @State var money2 = ["dollar", "euro", "yen", "sterling", "peso", "indianrupee", "brazilianreal", "franc", "turkishlira"]
    @State var data1 = ""
    @State var moneyName = ""
    @State var selectedMoney = ""
    @State var dict = [String: String]()
    @State var price = [String]()
    
    var body: some View {
        VStack {
            
            Picker("Moneys", selection: $selectedOption) {
                ForEach(0..<money.count) { index in
                    Text(money[index])
                }
            }
            .pickerStyle(.segmented)
            
            // ---------- Dolar Kısmı -----------
            HStack {
                
                Image(systemName: "\(money2[selectedOption])sign.circle")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                
                VStack {
                    Text("\(money[selectedOption])")
                        .padding()
                        .foregroundColor(.orange)
                }
            }
            .frame(width: 150 ,height: 50)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 200)
                    .stroke(.blue, lineWidth: 4)
            )
            
            Spacer()
            
            Button("Tıklayın"){
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
            
            // ----------------------------------
            
            // ---------- Para Birimleri 1.Kısım -----------
            
            HStack(spacing: 20) {
                VStack {
                    HStack {
                        Image(systemName: "\(money2[selectedOption])sign.circle")
                            .font(.system(size: 25))
                        Image(systemName: "dollarsign.circle")
                            .font(.system(size: 25))
                    }
                    HStack {
                        Text("\(money[selectedOption])/USD")
                    }
                    
                    if price.count == 9 {
                        HStack {
                            Text("\(price[0])")
                        }
                    }
                }
                .frame(width: 80, height: 70)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.green, lineWidth: 4)
                )
                
                VStack {
                    HStack {
                        Image(systemName: "\(money2[selectedOption])sign.circle")
                            .font(.system(size: 25))
                        Image(systemName: "eurosign.circle")
                            .font(.system(size: 25))
                    }
                    HStack {
                        Text("\(money[selectedOption])/EUR")
                    }
                    if price.count == 9 {
                        HStack {
                            Text("\(price[1])")
                        }
                    }
                }
                .frame(width: 80, height: 70)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.green, lineWidth: 4)
                )
                
                VStack {
                    HStack {
                        Image(systemName: "\(money2[selectedOption])sign.circle")
                            .font(.system(size: 25))
                        Image(systemName: "yensign.circle")
                            .font(.system(size: 25))
                    }
                    HStack {
                        Text("\(money[selectedOption])/JPY")
                    }
                    if price.count == 9 {
                        HStack {
                            Text("\(price[2])")
                        }
                    }
                }
                .frame(width: 80, height: 70)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.green, lineWidth: 4)
                )
            }
            
            // ------------------------- Para Birimleri 2.kısım
            
            .padding()
            //Spacer()
            
            
            HStack(spacing: 20) {
                
                VStack {
                    HStack {
                        Image(systemName: "\(money2[selectedOption])sign.circle")
                            .font(.system(size: 25))
                        Image(systemName: "sterlingsign.circle")
                            .font(.system(size: 25))
                    }
                    HStack {
                        Text("\(money[selectedOption])/GBP")
                    }
                    if price.count == 9 {
                        HStack {
                            Text("\(price[3])")
                        }
                    }
                }
                .frame(width: 80, height: 70)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.green, lineWidth: 4)
                )
                
                VStack {
                    HStack {
                        Image(systemName: "\(money2[selectedOption])sign.circle")
                            .font(.system(size: 25))
                        Image(systemName: "pesosign.circle")
                            .font(.system(size: 25))
                    }
                    HStack {
                        Text("\(money[selectedOption])/MXN")
                    }
                    if price.count == 9 {
                        HStack {
                            Text("\(price[4])")
                        }
                    }
                }
                .frame(width: 80, height: 70)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.green, lineWidth: 4)
                )
                
                VStack {
                    HStack {
                        Image(systemName: "\(money2[selectedOption])sign.circle")
                            .font(.system(size: 25))
                        Image(systemName: "indianrupeesign.circle")
                            .font(.system(size: 25))
                    }
                    HStack {
                        Text("\(money[selectedOption])/AUD")
                    }
                    if price.count == 9 {
                        HStack {
                            Text("\(price[5])")
                        }
                    }
                }
                .frame(width: 80, height: 70)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.green, lineWidth: 4)
                )
                
            }
            
            .padding()
            //Spacer()
            
            
            
            // ------------------------- Para Birimleri 3.kısım
            
            HStack(spacing: 20) {
                VStack {
                    HStack {
                        Image(systemName: "\(money2[selectedOption])sign.circle")
                            .font(.system(size: 25))
                        Image(systemName: "brazilianrealsign.circle")
                            .font(.system(size: 25))
                    }
                    HStack {
                        Text("\(money[selectedOption])/INR")
                    }
                    if price.count == 9 {
                        HStack {
                            Text("\(price[6])")
                        }
                    }
                }
                .frame(width: 80, height: 70)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.green, lineWidth: 4)
                )
                
                VStack {
                    HStack {
                        Image(systemName: "\(money2[selectedOption])sign.circle")
                            .font(.system(size: 25))
                        Image(systemName: "francsign.circle")
                            .font(.system(size: 25))
                    }
                    HStack {
                        Text("\(money[selectedOption])/CHF")
                    }
                    if price.count == 9 {
                        HStack {
                            Text("\(price[7])")
                        }
                    }
                }
                .frame(width: 80, height: 70)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.green, lineWidth: 4)
                )
                
                VStack {
                    HStack {
                        Image(systemName: "\(money2[selectedOption])sign.circle")
                            .font(.system(size: 25))
                        Image(systemName: "turkishlirasign.circle")
                            .font(.system(size: 25))
                    }
                    HStack {
                        Text("\(money[selectedOption])/TRY")
                    }
                    if price.count == 9 {
                        HStack {
                            Text("\(price[8])")
                        }
                    }
                }
                .frame(width: 80, height: 70)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.green, lineWidth: 4)
                )
                
            }
            
            .padding()
            Spacer()
            
            
            
            VStack {
                
                NavigationLink(destination: ThirdView()){
                    Text("Converter")
                }
                .font(.largeTitle)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 150)
                        .stroke(.orange, lineWidth: 4)
                )
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
