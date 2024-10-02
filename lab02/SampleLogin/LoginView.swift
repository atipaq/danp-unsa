//
//  LoginView.swift
//  SampleLogin
//
//  Created by Alex Huaracha on 25/09/24.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedin:Bool
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView{
            VStack {
                Image(.login)
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .scaledToFit()
                
                TextField("Username ", text: $username).textFieldStyle(.roundedBorder)
                
                SecureField("Password ", text: $password).textFieldStyle(.roundedBorder)
                
                Button("Login", action: btnLogin).buttonStyle(.borderedProminent)
                
                NavigationLink(destination: CreateAccountView()){
                    Text("Create my account")
                }
                .navigationTitle("Login")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            }
        }
        
    }
    
    func btnLogin() {
        isLoggedin = true
    }
}
