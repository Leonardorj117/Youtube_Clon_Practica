//
//  PlaylistModel.swift
//  Youtube_Clon_Practica
//
//  Created by Leonardo Rubio on 14/11/22.
//

import Foundation

//MARK: - PlaylistModel
struct PlaylistModel : Decodable{
    let kind:String
    let etag:String
    let nextPageToken:String
    let pageInfo:PageInfo
    let items:[Items]
    
    //MARK: - PageInfo
    struct PageInfo:Decodable{
        let totalResults: Int
        let resultsPerPage:Int
    }
    //MARK: - Items
    struct Items:Decodable{
        let kind:String
        let etag:String
        let id:String
        let snippet:Snippet
        let contentDetails:ContentDetails
        
        //MARK: - Snippet
        struct Snippet:Decodable{
            let publishedAt:String
            let channelId: String
            let title:String
            let description:String
            let thumbnails:Thumbnails
            let channelTitle:String
            let localized:Localized
            
            //MARK: - Thumbnails
            struct Thumbnails:Decodable{
                let medium:Medium
                
                //MARK: - Medium
                struct Medium:Decodable{
                    let url:String
                    let width:Int
                    let height:Int
                }
            }
            
            //MARK: - Localized
            struct Localized:Decodable{
                let title:String
                let description:String
            }
        }
        
        //MARK: - ContentDetails
        struct ContentDetails:Decodable{
            let itemCount:Int
        }
    }
}

