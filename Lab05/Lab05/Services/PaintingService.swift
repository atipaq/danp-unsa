//
//  PaintingService.swift
//  lab05
//
//  Created by Alex Huaracha on 28/10/24.
//

import FirebaseFirestore

class PaintingService {
    private var db = Firestore.firestore()
    private var lastDocument: DocumentSnapshot?

    func fetchPaintings(pageSize: Int, completion: @escaping ([Painting]?, Error?) -> Void) {
        var query = db.collection("database-lab").order(by: "Year of Painting").limit(to: pageSize)
        
        if let lastDocument = lastDocument {
            query = query.start(afterDocument: lastDocument)
        }
        
        query.getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching documents: \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            
            guard let snapshot = snapshot else {
                print("No data found in snapshot.")
                completion(nil, nil)
                return
            }
            
            let paintings = snapshot.documents.compactMap { document -> Painting? in
                var painting: Painting?
                do {
                    painting = try document.data(as: Painting.self)
                    painting?.id = document.documentID  // Asigna el id manualmente
                } catch {
                    print("Error decoding painting: \(error)")
                }
                return painting
            }
            
            self.lastDocument = snapshot.documents.last
            print("Fetched \(paintings.count) paintings.")
            completion(paintings, nil)
        }
    }
    
    func resetPagination() {
        lastDocument = nil
    }
}

