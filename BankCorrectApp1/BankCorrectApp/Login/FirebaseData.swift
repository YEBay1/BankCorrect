//
//  FirebaseData.swift
//  BankCorrectApp
//
//  Created by Yunus Emre Bayezit on 20.08.2023.
//

import SwiftUI
import Combine
import Firebase
import FirebaseAuth

class SessionStore : ObservableObject {
    var objectWillChange = PassthroughSubject<SessionStore, Never>()
    var session: User? {didSet{self.objectWillChange.send(self)}}
    var handle : AuthStateDidChangeListenerHandle?
    
    func listen() {
        handle = Auth.auth().addStateDidChangeListener({(auth, user) in
            if let user = user {
                print("User: \(user)")
                self.session = User(id: user.uid, email: user.email, displayname: user.displayName)
            }
            
            else{
                self.session = nil
            }
        })
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in 
            
        }
    }
    
    func signOut() {
        
    }
    
    func userDelete() {
        
    }
}

class User {
    var id: String
    var email : String?
    var displayname: String?
    
    init(id: String, email: String?, displayname: String?) {
        self.id = id
        self.email = email
        self.displayname = displayname
    }
}
