//
//  ContentView.swift
//  lab05
//
//  Created by Alex Huaracha on 24/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PaintingViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.paintings) { painting in
                    NavigationLink(destination: PaintingDetailView(painting: painting)) {
                        PaintingRowView(painting: painting)
                    }
                    .onAppear {
                        if painting.id == viewModel.paintings.last?.id {
                            viewModel.loadPaintings()  // Carga más datos al final de la lista
                        }
                    }
                }
            }
            .navigationTitle("Art Gallery")
        }
        .onAppear {
            viewModel.resetPagination()
        }
    }
}


//#Preview {
 //   ContentView()
//}

