//
//  HomePresenter.swift
//  Youtube_Clon_Practica
//
//  Created by Leonardo Rubio on 21/11/22.
//

import Foundation
protocol HomeViewProtocol: AnyObject{
    func getData(list: [[Any]])
}
class HomePresenter {
    var provider:HomeProviderProtocol
    weak var delegate:HomeViewProtocol?
    private var objectList:[[Any]] = []
    
    init(delegate: HomeViewProtocol,provider: HomeProviderProtocol = HomeProvider()) {
        self.provider = provider
        self.delegate = delegate
    }
    func getHomeObjects() async{
        self.objectList.removeAll()
        do{
            let channel = try await self.provider.getChanel(channelId: K.chanelId).items
            let videos = try await self.provider.getVideos(searchString: "", channelId: K.chanelId).items
            let playLists = try await self.provider.getPlayLists(channelId: K.chanelId).items
            let playListItems = try await self.provider.getPlayListItems(playlistId:playLists.first?.id ?? "" ).items
            
            self.objectList.append(channel)
            self.objectList.append(playListItems)
            self.objectList.append(videos)
            self.objectList.append(playLists)
        }catch{
            print(error)
        }
    }
}
