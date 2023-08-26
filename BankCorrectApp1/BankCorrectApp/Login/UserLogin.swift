//
//  UserLogin.swift
//  BankCorrectApp
//
//  Created by Yunus Emre Bayezit on 20.08.2023.
//

import SwiftUI

struct UserLogin: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        VStack(spacing: 40) {
            TextField("Email", text: $email)
            TextField("Password", text: $password)
            
            Button(action: {}) {
                Text("Login")
            }
        } .frame(width: 400)
        
        
    }
}

struct UserLogin_Previews: PreviewProvider {
    static var previews: some View {
        UserLogin()
    }
}
