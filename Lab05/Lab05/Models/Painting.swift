//
//  Painting.swift
//  lab05
//
//  Created by Alex Huaracha on 28/10/24.
//

import Foundation
import FirebaseFirestore

struct Painting: Identifiable, Codable {
    @DocumentID var id: String?
    
    let painting: String
    let artist: String
    let yearOfPainting: Int
    let adjustedPrice: String
    let originalPrice: String
    let dateOfSale: String
    let yearOfSale: Int
    let seller: String
    let buyer: String
    let auctionHouse: String
    let image: String
    let paintingWikipediaProfile: String
    let artistWikipediaProfile: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case id
        case painting = "Painting"
        case artist = "Artist"
        case yearOfPainting = "Year of Painting"
        case adjustedPrice = "Adjusted Price"
        case originalPrice = "Original Price"
        case dateOfSale = "Date of Sale"
        case yearOfSale = "Year of Sale"
        case seller = "Seller"
        case buyer = "Buyer"
        case auctionHouse = "Auction House"
        case image = "Image"
        case paintingWikipediaProfile = "Painting Wikipedia Profile"
        case artistWikipediaProfile = "Artist Wikipedia Profile"
        case description = "Description"
    }
}
