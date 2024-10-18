//
//  UserViewModel.swift
//  lab04
//
//  Created by Alex Huaracha on 17/10/24.
//

import SwiftUI

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    private var currentPage = 1
    private var isLoading = false

    func fetchUsers() {
        // Evitar cargar si ya estamos cargando datos
        guard !isLoading else { return }

        isLoading = true
        guard let url = URL(string: "https://randomuser.me/api/?page=\(currentPage)&results=10") else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Manejar error y respuesta
            if let data = data {
                do {
                    let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.users.append(contentsOf: userResponse.results) // Agregar nuevos usuarios
                        self.currentPage += 1 // Incrementar la página
                        self.isLoading = false // Finalizamos la carga
                    }
                } catch {
                    print("Error decoding: \(error)")
                    DispatchQueue.main.async {
                        self.isLoading = false
                    }
                }
            } else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }.resume()
    }
}
