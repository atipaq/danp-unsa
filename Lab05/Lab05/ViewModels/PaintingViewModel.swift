//
//  PaintingViewModel.swift
//  lab05
//
//  Created by Alex Huaracha on 28/10/24.
//

import Foundation
import Combine

class PaintingViewModel: ObservableObject {
    @Published var paintings: [Painting] = []
    private let paintingService = PaintingService()
    private let pageSize = 10
    private var isLoading = false

    init() {
        loadPaintings()
    }
    
    func loadPaintings() {
        guard !isLoading else { return }
        isLoading = true
        paintingService.fetchPaintings(pageSize: pageSize) { [weak self] newPaintings, error in
            DispatchQueue.main.async {
                if let newPaintings = newPaintings {
                    self?.paintings.append(contentsOf: newPaintings)
                }
                self?.isLoading = false
            }
        }
    }
    
    func resetPagination() {
        paintings.removeAll()
        paintingService.resetPagination()
        loadPaintings()
    }
}
