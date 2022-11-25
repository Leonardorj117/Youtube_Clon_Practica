//
//  MainViewController.swift
//  Youtube_Clon_Practica
//
//  Created by Leonardo Rubio on 14/11/22.
//

import UIKit

class MainViewController: UIViewController {
    
    var rootpageViewController:RootPageViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RootPageViewController{
            destination.delegateRoot = self
            self.rootpageViewController = destination
        }
    }
    
}

extension MainViewController:RootPageProtocol{
    func currentPage(_ Index: Int) {
        print("Current page,", Index)
    }
}
