//
//  DishesViewController.swift
//  Wat eet ik vandaag?
//
//  Created by Niels Beeuwkes on 14/04/2019.
//  Copyright © 2019 Niels Beeuwkes. All rights reserved.
//

import UIKit

final class DishesViewController: UIViewController, Controller {
    
    let controllerView: View
    var dishes: [Dish] = []
    
    init(view: View) {
        controllerView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.addSubview(controllerView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.title = "Dishes"
    }
}
