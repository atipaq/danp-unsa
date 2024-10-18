//
//  ContentView.swift
//  lab04
//
//  Created by Alex Huaracha on 16/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = UserViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.users, id: \.email) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    HStack {
                        if let imageUrl = URL(string: user.picture.large) {
                            AsyncImage(url: imageUrl) { image in
                                image
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("\(user.name.title) \(user.name.first) \(user.name.last)")
                                .font(.headline)
                            Text(user.email)
                                .font(.subheadline)
                        }
                    }
                    .onAppear {
                        // Detectar el último usuario visible y cargar más usuarios
                        if user == viewModel.users.last {
                            viewModel.fetchUsers()
                        }
                    }
                }
            }
            .navigationTitle("Usuarios")
            .onAppear {
                // Cargar usuarios solo si la lista está vacía
                if viewModel.users.isEmpty {
                    viewModel.fetchUsers()
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
