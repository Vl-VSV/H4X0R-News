//
//  PostData.swift
//  H4X0R News
//
//  Created by Vlad V on 04.09.2022.
//

import Foundation

struct Result: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    var id: String{
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
