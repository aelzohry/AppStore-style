//
//  PageController.swift
//  AppStore Style
//
//  Created by Ahmed Elzohry on 7/29/16.
//  Copyright © 2016 Ahmed Elzohry. All rights reserved.
//

import UIKit

class PageController: UIPageViewController, UIPageViewControllerDataSource {
    
    var images = [String]()
    var VCs = [ImagePageVC]()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : AnyObject]?) {
        super.init(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: options)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        VCs = [ImagePageVC]()
        for image in images {
            let imageVC = ImagePageVC()
            imageVC.image = image
            
            VCs.append(imageVC)
        }
        
        
        setViewControllers([VCs[0]], direction: .Forward, animated: true, completion: nil)
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return images.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        if let vc = viewController as? ImagePageVC, let index = VCs.indexOf(vc) {
            if VCs.count-1 > index {
                let nextVC = VCs[index+1]
                return nextVC
            }
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        if let vc = viewController as? ImagePageVC, let index = VCs.indexOf(vc) {
            if index > 0 {
                let previousVC = VCs[index-1]
                return previousVC
            }
        }
        
        return nil
    }
}
