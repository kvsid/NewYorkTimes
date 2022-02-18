//
//  ArticlesTableViewCell.swift
//  NewYorkTimes
//
//  Created by Xenia Sidorova on 17.02.2022.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {

    var currentArticle : Result? = nil
    let storage = ArticlesStorage()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var titleBackgroundView: UIView!

    let articlesVC = ArticlesViewController()

    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        addFavorites()
        favoriteButton.isSelected = !favoriteButton.isSelected
    }

    func configure(with model: Result) {
        currentArticle = model
        titleLabel.text = model.title
        titleLabel.numberOfLines = 0

        favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .selected)

        titleBackgroundView.backgroundColor = Constants.Colors.cellColor
        favoriteButton.isSelected = storage.isSaved(id: model.id)
    }

    func addFavorites() {
        guard let article = currentArticle else { return }

        if favoriteButton.isSelected {
            storage.remove(id: article.id)
        } else {
            storage.save(article: article)
        }
    }
}
