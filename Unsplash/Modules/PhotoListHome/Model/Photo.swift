//
//  Photo.swift
//  Unsplash
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import Foundation

struct Photo: Codable {
    let id: String?
    let likes: Int?
    let urls: Urls? 
    let user: User?
}
