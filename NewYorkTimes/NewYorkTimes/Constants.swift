//
//  Constants.swift
//  NewYorkTimes
//
//  Created by Xenia Sidorova on 17.02.2022.
//

import UIKit

struct Constants {

    struct Colors {
        static var cellColor: UIColor {
            return UIColor(red: 158/255.0, green: 151/255.0, blue: 140/255.0, alpha: 1)
        }

        static var favoriteCellColor: UIColor {
            return UIColor(red: 255/255.0, green: 206/255.0, blue: 131/255.0, alpha: 1)
        }
    }

    struct URL {
        static var baseURL: String {
            return "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=sG7Gf1XG2vnPYinFDaVO3OTAF3z2ViPN"
        }
    }
}
