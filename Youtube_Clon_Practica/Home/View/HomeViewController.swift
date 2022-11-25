//
//  HomeViewController.swift
//  Youtube_Clon_Practica
//
//  Created by Leonardo Rubio on 15/11/22.
//

import UIKit

class HomeViewController: UIViewController {
   lazy var presenter = HomePresenter(delegate: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task{
            await self.presenter.getHomeObjects()
        }
    }

}

extension HomeViewController:HomeViewProtocol{
    func getData(list: [[Any]]) {
        print("list",list)
    }
    
    
}
