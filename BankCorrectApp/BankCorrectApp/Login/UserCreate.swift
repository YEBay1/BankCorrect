//
//  UserCreate.swift
//  BankCorrectApp
//
//  Created by Yunus Emre Bayezit on 20.08.2023.
//

import SwiftUI

struct UserCreate: View {
    
    @State var createMail = ""
    @State var createPassword = ""
    
    var body: some View {
        
        VStack(spacing: 40) {
            TextField("Email", text: $createMail)
            TextField("Password", text: $createPassword)
            
            Button(action: {}) {
                Text("Register")
            }
        } .frame(width: 400)
        
    }
}

struct UserCreate_Previews: PreviewProvider {
    static var previews: some View {
        UserCreate()
    }
}
