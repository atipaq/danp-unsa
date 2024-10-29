//
//  PaintingDetailView.swift
//  lab05
//
//  Created by Alex Huaracha on 29/10/24.
//

import SwiftUI

struct PaintingDetailView: View {
    let painting: Painting

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: painting.image)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(painting.painting)
                    .font(.largeTitle)
                    .bold()
                
                Text("By \(painting.artist), \(painting.yearOfPainting)")
                    .font(.title3)
                    .foregroundColor(.secondary)
                
                Divider()

                Text("Description")
                    .font(.headline)
                Text(painting.description)
                    .font(.body)

                Divider()

                Text("Auction Details")
                    .font(.headline)
                
                Group {
                    Text("Adjusted Price: \(painting.adjustedPrice)")
                    Text("Original Price: \(painting.originalPrice)")
                    Text("Date of Sale: \(painting.dateOfSale)")
                    Text("Auction House: \(painting.auctionHouse)")
                    Text("Buyer: \(painting.buyer)")
                    Text("Seller: \(painting.seller)")
                }
                .font(.body)
                
                Link("Learn more about the painting", destination: URL(string: painting.paintingWikipediaProfile)!)
                    .padding(.top, 10)
                
                Link("Learn more about the artist", destination: URL(string: painting.artistWikipediaProfile)!)
                    .padding(.top, 2)
            }
            .padding()
        }
        .navigationTitle("Details")
    }
}
