//
//  RootPageViewController.swift
//  Youtube_Clon_Practica
//
//  Created by Leonardo Rubio on 14/11/22.
//

import UIKit

protocol RootPageProtocol:AnyObject{
    func currentPage (_ Index:Int)
}

class RootPageViewController: UIPageViewController {
    
    var subViewControllers = [UIViewController]()
    var currentIndex:Int = 0
    weak var delegateRoot : RootPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        setUpViewControllers()
        
    }
    
    private func setUpViewControllers(){
        self.subViewControllers = [
            HomeViewController(),
            VideosViewController(),
            PlaylistsViewController(),
            ChanelViewController(),
            AboutViewController()
        ]
        _ = subViewControllers.enumerated().map({$0.element.view.tag = $0.offset})
        setViewControllerFromIndex(index: 0, direction: .forward)
    }
    
    func setViewControllerFromIndex(index:Int,direction:NavigationDirection,animated:Bool = true){
        
        setViewControllers([subViewControllers[index]], direction: direction, animated: animated)
        
    }
    
}

//MARK: - UIPageViewControllerDelegate,UIPageViewControllerDataSource
extension RootPageViewController:UIPageViewControllerDelegate,UIPageViewControllerDataSource{
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index:Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if index <= 0{
            return nil
        }
        return subViewControllers[index-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index:Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if index >= (self.subViewControllers.count-1){
            return nil
        }
        return subViewControllers[index+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("finished",finished)
        if let index = pageViewController.viewControllers?.first?.view.tag{
            self.currentIndex = index
            self.delegateRoot?.currentPage(index)
        }
    }
    
}
