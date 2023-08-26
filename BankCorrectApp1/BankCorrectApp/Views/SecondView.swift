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
    @State var money2 = ["dollar", "euro", "yen", "sterling", "franc", "turkishlira"]
    @State var design = ["3Cell", "6Cell"]
    @State private var selectedDesign = 0
    @State var data1 = ""
    @State var moneyName = ""
    @State var selectedMoney = ""
    @State var dict = [String: String]()
    @State var price : [String]
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
                    
                    print(price)   // price içerisine append ediliyor
                    
                case .failure(let error):
                    // Hata durumunda burası çalışır
                    print("Error: \(error.localizedDescription)")
                    
                }
            }
            
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                mainPicker(selectedOption: $selectedOption, price: $price)
                
                ScrollView {
                    HStack {
                        
                        VStack {
                            Image(systemName: "\(money2[selectedOption])sign.circle")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .onAppear {
                                    converter()
                                }
                            
                                .animation(.linear)
                        }
                        
                        VStack {
                            Text("\(money[selectedOption])")
                                .padding()
                                .font(.system(size: 30))
                                .animation(.easeOut)
                            
                        }
                        
                        Spacer()
                        
                        Button("Change") {
                            count += 1
                        }
                        
                        Spacer()
                    }
                    .padding()
                    
                    
                    HStack {
                        if count % 2 == 0 {
                            Cell1(selectedOption: $selectedOption, price: $price)
                        }
                        
                        else {
                            Cell2(selectedOption: $selectedOption, price: $price)
                        }
                        
                    }
                }
            }
            .foregroundColor(.black)
            .padding(.horizontal)
            .multilineTextAlignment(.center)
            .background {
                LinearGradient(colors: [.blue, .white ], startPoint: .topLeading, endPoint: .bottomTrailing)
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
}



struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(price: [""])
            .preferredColorScheme(.dark)
    }
}

struct model: Decodable {
    var result: Float = 0.0
}
