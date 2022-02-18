//
//  ArticlesViewController.swift
//  NewYorkTimes
//
//  Created by Xenia Sidorova on 15.02.2022.
//

import UIKit

class ArticlesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var articlesTableView: UITableView!

    private var articles = [Result]()
    var favoritesArray: [Result] = []
    var networkService = NetwokService()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Most popular"
        setupTable()
        loadArticles()
    }

    private func setupTable() {
        articlesTableView?.register(UINib(nibName: "ArticlesTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticlesTableViewCell")
        articlesTableView?.delegate = self
        articlesTableView?.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticlesTableViewCell", for: indexPath) as? ArticlesTableViewCell {
            cell.configure(with: articles[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "CurrentArticle", bundle: nil)
        let currentArticle = storyboard.instantiateViewController(withIdentifier: "CurrentArticleViewController") as! CurrentArticleViewController
        currentArticle.article = articles[indexPath.row]

        self.navigationController?.pushViewController(currentArticle, animated: true)
    }

    func loadArticles() {
        networkService.requestArticles { (results) in
            DispatchQueue.main.async {
                self.articles = results
                self.articlesTableView.reloadData()
            }
        }
    }
}
