//
//  PaintingRowView.swift
//  lab05
//
//  Created by Alex Huaracha on 28/10/24.
//

import SwiftUI

struct PaintingRowView: View {
    let painting: Painting

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: painting.image)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading) {
                Text(painting.painting)
                    .font(.headline)
                Text("By \(painting.artist), \(painting.yearOfPainting)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
