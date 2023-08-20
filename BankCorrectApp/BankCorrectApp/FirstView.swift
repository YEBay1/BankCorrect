//
//  FirstView.swift
//  BankCorrect
//
//  Created by Yunus Emre Bayezit on 17.06.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct FirstView: View {
    
    @State var emailAdress: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        // View görüntülenmeden önce bir kod çalıştırmak istiyorsak aşağıdaki kod bloğunu kullanırız
        /*
         .onAppear {
         // View görüntülenmeden önce çalışmasını istediğiniz kodu buraya yazın
         print("View görüntülendi!")
         }
         */
        
        NavigationView {
            VStack {
                
                Text("Welcome To The BankCorrect")
                    .padding(.bottom, 100)
                    .font(.largeTitle)
                    .frame(width: 400)
                    .lineSpacing(5)
                    .fontDesign(.serif)
                    .foregroundColor(Color.green)
                
                TextField("Email Adress", text: $emailAdress)
                    .textContentType(.emailAddress)
                    .keyboardType(.alphabet)
                    .padding()
                    .background(Color.white.opacity(0.3))
                    .cornerRadius(15)
                    .padding()
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.3))
                    .cornerRadius(15)
                    .padding()
                
                HStack{
                    NavigationLink(destination: SecondView()){
                        Text("Giriş")
                    }
                }
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
            .preferredColorScheme(.dark)
    }
}
