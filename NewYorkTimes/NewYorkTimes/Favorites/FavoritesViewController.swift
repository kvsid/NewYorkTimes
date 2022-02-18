//
//  FavoritesViewController.swift
//  NewYorkTimes
//
//  Created by Xenia Sidorova on 15.02.2022.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var favoritesTableView: UITableView!

    let storage = ArticlesStorage()
    var favorites = [Result]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"
        favorites = storage.fetchAll()
        setupTable()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favorites = storage.fetchAll()
        favoritesTableView.reloadData()
    }

    private func setupTable() {
        favoritesTableView?.register(UINib(nibName: "FavoriteArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoriteArticleTableViewCell")
        favoritesTableView?.delegate = self
        favoritesTableView?.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteArticleTableViewCell", for: indexPath) as? FavoriteArticleTableViewCell {
            cell.configure(with: favorites[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "CurrentArticle", bundle: nil)
        let currentArticle = storyboard.instantiateViewController(withIdentifier: "CurrentArticleViewController") as! CurrentArticleViewController
        currentArticle.article = favorites[indexPath.row]

        self.navigationController?.pushViewController(currentArticle, animated: true)
    }

}
