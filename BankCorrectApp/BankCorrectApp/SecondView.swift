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
    
    @State var design = ["3Cell", "6Cell", "9Cell"]
    @State private var selectedDesign = 0
    
    @State var data1 = ""
    @State var moneyName = ""
    @State var selectedMoney = ""
    @State var dict = [String: String]()
    @State var price = [String]()
    @State private var selected1 = 0
    @State var selectedMoney1 = ""
    @State var count = 0
    @State var correct = true
    
    private let startColor: Color = .blue
    private let endColor: Color = .cyan
    
    private let colorBlue: Color = .blue
    private let colorRed: Color = .red
    
    private let color11: Color = Color(red: 0.6, green: 0.2, blue: 1.0)
    private let color22: Color = Color(red: 0.9, green: 0.2, blue: 0.8)
    private let darkBlue: Color = Color(red: 0.3, green: 0.2, blue: 1.0)
    
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
        
        
        
        /*
        if selectedDesign == 0 {
            Cell1()
        }
        
        else if selectedDesign == 1 {
            Cell2()
        }
        
        else {
            Cell3()
        }*/
        
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
                        .onAppear {
                                    converter()
                        }
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
                
                Picker("Design", selection: $selectedDesign ) {
                    ForEach(0..<design.count) { index in
                        //Text(design[index])
                        
                        Text("\(selectedDesign)")
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
                                .foregroundColor(.white)
                                .font(.system(size: 45))
                            
                            
                            Text("\(money[selectedOption])")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                            
                        }
                        
                        .padding(15)
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "dollarsign.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 45))
                            Text("\(money[0])")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                            
                        }
                        Spacer()
                        
                        
                        VStack(spacing: 5) {
                            
                            if price.count == 6 {
                                HStack {
                                    Text("\(price[0])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                        
                                }
                            }
                            
                        }
                        Spacer()
                        
                    }
                }
                .frame(width: 340, height: 60)
                .padding()
                .background {
                    LinearGradient(
                                   colors: [color11, color22],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing
                               )
                }

            }
            .cornerRadius(25)
            
            
            HStack(spacing: 20) {
                
                VStack {
                    HStack {
                        VStack(spacing: 5) {
                            Image(systemName: "\(money2[selectedOption])sign.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 45))
                            
                            
                            Text("\(money[selectedOption])")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                            
                        }
                        
                        .padding(15)
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "eurosign.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 45))
                            Text("\(money[0])")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                            
                        }
                        Spacer()
                        
                        VStack(spacing: 5) {
                            
                            if price.count == 6 {
                                HStack {
                                    Text("\(price[1])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                }
                            }
                            
                        }
                        Spacer()
                        
                    }
                }
                .frame(width: 340, height: 60)
                .padding()
                .background {
                    LinearGradient(
                        colors: [color22, color11],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing
                               )
                }

            }
            .cornerRadius(25)
            
            
            HStack(spacing: 20) {
                
                VStack {
                    HStack {
                        VStack(spacing: 5) {
                            Image(systemName: "\(money2[selectedOption])sign.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 45))
                            
                            
                            Text("\(money[selectedOption])")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                            
                        }
                        
                        .padding(15)
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "yensign.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 45))
                            Text("\(money[0])")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                            
                        }
                        Spacer()
                        
                        VStack(spacing: 5) {
                            
                            if price.count == 6 {
                                HStack {
                                    Text("\(price[2])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                }
                            }
                            
                        }
                        Spacer()
                        
                    }
                }
                .frame(width: 340, height: 60)
                .padding()
                .background {
                    LinearGradient(
                        colors: [color11, color22],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing
                               )
                }

            }
            .cornerRadius(25)
            
            
            HStack(spacing: 20) {
                
                VStack {
                    HStack {
                        VStack(spacing: 5) {
                            Image(systemName: "\(money2[selectedOption])sign.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 45))
                            
                            
                            Text("\(money[selectedOption])")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                            
                        }
                        
                        .padding(15)
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "sterlingsign.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 45))
                            Text("\(money[0])")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                            
                        }
                        Spacer()
                        
                        VStack(spacing: 5) {
                            
                            if price.count == 6 {
                                HStack {
                                    Text("\(price[3])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                }
                            }
                            
                        }
                        Spacer()
                        
                    }
                }
                .frame(width: 340, height: 60)
                .padding()
                .background {
                    LinearGradient(
                        colors: [color22, color11],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing
                               )
                }

            }
            .cornerRadius(25)
            
            
            HStack(spacing: 20) {
                
                VStack {
                    HStack {
                        VStack(spacing: 5) {
                            Image(systemName: "\(money2[selectedOption])sign.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 45))
                            
                            
                            Text("\(money[selectedOption])")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                            
                        }
                        
                        .padding(15)
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "francsign.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 45))
                            Text("\(money[0])")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                            
                        }
                        Spacer()
                        
                        VStack(spacing: 5) {
                            
                            if price.count == 6 {
                                HStack {
                                    Text("\(price[4])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                }
                            }
                            
                        }
                        Spacer()
                        
                    }
                }
                .frame(width: 340, height: 60)
                .padding()
                .background {
                    LinearGradient(
                        colors: [color11, color22],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing
                               )
                }

            }
            .cornerRadius(25)
            
            HStack(spacing: 20) {
                
                VStack {
                    HStack {
                        VStack(spacing: 5) {
                            Image(systemName: "\(money2[selectedOption])sign.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 45))
                            
                            
                            Text("\(money[selectedOption])")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                            
                        }
                        
                        .padding(15)
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "turkishlirasign.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 45))
                            Text("\(money[0])")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                            
                        }
                        Spacer()
                        
                        VStack(spacing: 5) {
                            
                            if price.count == 6 {
                                HStack {
                                    Text("\(price[5])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                }
                            }
                            
                        }
                        Spacer()
                        
                    }
                }
                .frame(width: 340, height: 60)
                .padding()
                .background {
                    LinearGradient(
                        colors: [color22, color11],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing
                               )
                }

            }
            .cornerRadius(25)
        }
            .foregroundColor(.black)
            .padding(.horizontal)
            .multilineTextAlignment(.center)
            .background {
                LinearGradient(colors: [startColor, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
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
