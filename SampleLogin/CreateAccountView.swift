//
//  CreateAccountView.swift
//  SampleLogin
//
//  Created by Alex Huaracha on 25/09/24.
//

import SwiftUI

let lightGreyColor = Color(red:239.0/255.0,green:243.0/255.0,blue:244.0/255.0,opacity: 1.0)

struct CreateAccountView: View {
    @State var isLoggedin : Bool = false
    
    @State var username : String = ""
    @State var email : String = ""
    @State var password : String = ""
    @State var phone : String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Create Account")
                    .fontWeight(.semibold)
                    .padding(.bottom,20)
                TextField("Username", text:$username)
                    .padding()
                    .background(lightGreyColor)
                    .padding(.bottom,20)
                    .cornerRadius(5.0)
                    
                TextField("Email", text: $email)
                    .padding()
                    .background(lightGreyColor)
                    .padding(.bottom,20)
                    .cornerRadius(5.0)
                
                SecureField("Password", text:$password)
                    .padding()
                    .background(lightGreyColor)
                    .padding(.bottom,20)
                    .cornerRadius(5.0)
                
                TextField("Phone", text:$phone)
                    .padding()
                    .background(lightGreyColor)
                    .padding(.bottom,20)
                    .cornerRadius(5.0)
                
                NavigationLink {
                    HomeView()
                } label: {
                    Button("Create", action: {
                        print("procesando datos")
                    })
                        .buttonStyle(.borderedProminent)
                }

            }
            .padding()
        }
    }
}
