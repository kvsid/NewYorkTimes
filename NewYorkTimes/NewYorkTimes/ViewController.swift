//
//  ViewController.swift
//  NewYorkTimes
//
//  Created by Xenia Sidorova on 15.02.2022.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let appearance = tabBar.standardAppearance
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        tabBar.standardAppearance = appearance
    }
}
