//
//  UserDetailView.swift
//  lab04
//
//  Created by Alex Huaracha on 17/10/24.
//

import SwiftUI

struct UserDetailView: View {
    let user: User

    var body: some View {
        VStack {
            if let imageUrl = URL(string: user.picture.large) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            }
            
            Text("\(user.name.title) \(user.name.first) \(user.name.last)")
                .font(.largeTitle)
                .padding()
            
            Text("Email: \(user.email)")
                .font(.body)
                .padding()
            
            Text("Phone: \(user.phone)")
                .font(.body)
                .padding()
            
            Spacer()
        }
        .navigationTitle(user.name.first)
    }
}
