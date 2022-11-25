//
//  VideoModel.swift
//  Youtube_Clon_Practica
//
//  Created by Leonardo Rubio on 14/11/22.
//

import Foundation

// MARK: - VideoModel
struct VideoModel: Decodable {
    let kind, etag: String
    let items: [Item]
    let pageInfo:PageInfo
    
    // MARK: - PageInfo
    struct PageInfo: Decodable {
        let totalResults, resultsPerPage: Int
    }
    
    // MARK: - Item
    struct Item: Decodable {
        let kind, etag, id: String
        let snippet: Snippet
        let contentDetails: ContentDetails
        let status: Status
        let statistics: Statistics
        let topicDetails: TopicDetails
        
        // MARK: - Snippet
        struct Snippet: Decodable {
            let publishedAt: Date
            let channelId, title, description: String
            let thumbnails: Thumbnails
            let channelTitle: String
            let tags: [String]
            let categoryID, liveBroadcastContent: String
            let localized: Localized
            let defaultAudioLanguage: String
            
            enum CodingKeys: String, CodingKey {
                case publishedAt
                case channelId
                case title
                case description
                case thumbnails, channelTitle, tags
                case categoryID = "categoryId"
                case liveBroadcastContent, localized, defaultAudioLanguage
            }
            
            // MARK: - Thumbnails
            struct Thumbnails: Decodable {
                let thumbnailsDefault, medium, high, standard: Default
                let maxres: Default
                
                enum CodingKeys: String, CodingKey {
                    case thumbnailsDefault = "default"
                    case medium, high, standard, maxres
                }
                
                // MARK: - Default
                struct Default: Decodable {
                    let url: String
                    let width, height: Int
                }
            }
            
            // MARK: - Localized
            struct Localized: Decodable {
                let title, localizedDescription: String
                
                enum CodingKeys: String, CodingKey {
                    case title
                    case localizedDescription = "description"
                }
            }
            
        }
        
        // MARK: - ContentDetails
        struct ContentDetails: Decodable {
            let duration, dimension, definition, caption: String
            let licensedContent: Bool
            let projection: String
        }
        
        // MARK: - Status
        struct Status: Decodable {
            let uploadStatus, privacyStatus, license: String
            let embeddable, publicStatsViewable, madeForKids: Bool
        }
        
        // MARK: - Statistics
        struct Statistics: Decodable {
            let viewCount, likeCount, favoriteCount, commentCount: String
        }
        
        // MARK: - TopicDetails
        struct TopicDetails: Decodable {
            let topicCategories: [String]
        }
        
    }
}



