//
//  HomeProvider.swift
//  Youtube_Clon_Practica
//
//  Created by Leonardo Rubio on 21/11/22.
//

import Foundation

protocol HomeProviderProtocol{
    func getVideos(searchString:String,channelId:String) async throws -> VideoModel
    func getChanel(channelId:String) async throws -> ChannelModel
    func getPlayLists(channelId:String) async throws -> PlaylistModel
    func getPlayListItems(playlistId:String) async throws -> PlaylistItemsModel
    
}

class HomeProvider:HomeProviderProtocol {
    
    //MARK: - Videos call
    
    func getVideos(searchString:String,channelId:String) async throws -> VideoModel{
        var queryParams:[String:String] = ["part":"snippet","type":"video"]
        if !channelId.isEmpty{
            queryParams["channelId"] = channelId
        }
        if !searchString.isEmpty{
            queryParams["q"] = searchString
        }
        let requestModel = RequestModel(endPoint: .search, queryItems: queryParams)
        do{
            let model = try await ServiceLayer.callService(requestModel, VideoModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
    
    //MARK: - Channels call
    
    func getChanel(channelId:String) async throws -> ChannelModel{
        let queryParams:[String:String] = ["part":"snippet,statistics,brandingSettings", "id":channelId]
        let requestModel = RequestModel(endPoint: .channels, queryItems: queryParams)
        do{
            let model = try await ServiceLayer.callService(requestModel,ChannelModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
    
    //MARK: - PlayList call
    
    func getPlayLists(channelId:String) async throws -> PlaylistModel{
        let queryParams:[String:String] = ["part":"snippet,contentDetails", "channelId":channelId]
        let requestModel = RequestModel(endPoint: .playlist, queryItems: queryParams)
        do{
            let model = try await ServiceLayer.callService(requestModel,PlaylistModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
    
    
    //MARK: - PlayListItems call
    
    func getPlayListItems(playlistId:String) async throws -> PlaylistItemsModel{
        let queryParams:[String:String] = ["part":"snippet,id,contentDetails", "playlistId":playlistId]
        let requestModel = RequestModel(endPoint: .playlistItems, queryItems: queryParams)
        do{
            let model = try await ServiceLayer.callService(requestModel,PlaylistItemsModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
    
    
    
    
}
