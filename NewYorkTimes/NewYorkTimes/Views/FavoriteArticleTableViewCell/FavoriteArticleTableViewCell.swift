//
//  FavoriteArticleTableViewCell.swift
//  NewYorkTimes
//
//  Created by Xenia Sidorova on 17.02.2022.
//

import UIKit

class FavoriteArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleBackgroundView: UIView!

    func configure(with model: Result) {
        titleLabel.text = model.title
        titleLabel.numberOfLines = 0

        titleBackgroundView.backgroundColor = Constants.Colors.favoriteCellColor
    }
}
