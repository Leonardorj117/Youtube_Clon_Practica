//
//  RequestModel.swift
//  Youtube_Clon_Practica
//
//  Created by Leonardo Rubio on 16/11/22.
//

import Foundation

struct RequestModel{
    let endPoint:EndPoints
    let queryItems:[String:String]?
    let httpMethod:HttpMethod = .GET
    var baseUrl:URLBase = .youtube
    
    
    func getURL() -> String{
        return baseUrl.rawValue + endPoint.rawValue
    }
    
    enum HttpMethod:String{
        case GET
        case POST
    }
    enum EndPoints:String{
        case search = "/search"
        case channels = "/channels"
        case playlist = "/playlists"
        case playlistItems = "/playlistItems"
        case empty = ""
    }
    enum URLBase:String{
        case youtube = "https://youtube.googleapis.com/youtube/v3"
        case google = "https://otherweb.com/v2"
    }
}
