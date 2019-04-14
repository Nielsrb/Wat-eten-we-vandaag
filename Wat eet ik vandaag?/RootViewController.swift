//
//  ViewController.swift
//  Wat eet ik vandaag?
//
//  Created by Niels Beeuwkes on 14/04/2019.
//  Copyright © 2019 Niels Beeuwkes. All rights reserved.
//

import UIKit

class RootViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tabbarcontroller = UITabBarController()
        
        let dishesViewController = DishesViewController(view: DishesView(frame: view.bounds))
        dishesViewController.tabBarItem = UITabBarItem(title: "Dishes", image: UIImage(named: "ic_team"), selectedImage: UIImage.coloredImage(named: "ic_team", color: Colors.darkGray))
        
        tabbarcontroller.viewControllers = [dishesViewController]
        pushViewController(tabbarcontroller, animated: true)
    }


}

