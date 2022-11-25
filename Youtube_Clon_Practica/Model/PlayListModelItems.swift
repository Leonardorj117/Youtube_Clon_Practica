//
//  PlayListModelItems.swift
//  Youtube_Clon_Practica
//
//  Created by Leonardo Rubio on 25/11/22.
//

import Foundation

struct PlaylistItemsModel: Decodable{
    let kind: String
    let etag: String
    let items: [PlaylistItems]
    let pageInfo : PageInfo
    
    struct PlaylistItems: Decodable{
        let kind : String
        let etag : String
        let id : String
        let snippet : VideoModel.Item.Snippet
    }
    
    struct PageInfo: Decodable{
        let totalResults: Int
        let resultsPerPage: Int
    }
}
