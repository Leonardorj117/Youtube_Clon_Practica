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
    
    init(delegate: HomeViewProtocol,provider: HomeProviderProtocol = HomeProvider()) {
        self.provider = provider
        self.delegate = delegate
    }
    func getVideos(){
        
    }
}
