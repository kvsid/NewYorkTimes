//
//  CurrentArticleViewController.swift
//  NewYorkTimes
//
//  Created by Xenia Sidorova on 15.02.2022.
//

import UIKit

class CurrentArticleViewController: UIViewController {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var publDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var openArticleButton: UIButton!

   // var media: MediaMetadatum?
    var article: Result?

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadImage()

        configureView()
    }

    @IBAction func openArticleButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "ArticleWeb", bundle: nil)
        let articleWeb = storyboard.instantiateViewController(withIdentifier: "ArticleWebViewController") as! ArticleWebViewController
        articleWeb.article = article

        self.navigationController?.pushViewController(articleWeb, animated: true)
    }

    func downloadImage() {
        
        if let url = URL(string: article?.media[0].mediaMetadata[0].url ?? "") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }

                DispatchQueue.main.async {
                    self.articleImage.image = UIImage(data: data)
                }
            }

            task.resume()
        }
    }

    func configureView() {
        articleTitle.text = article?.title
        authorLabel.text = article?.byline
        descriptionLabel.text = article?.abstract
        publDateLabel.text = article?.publishedDate

        backView.backgroundColor = Constants.Colors.cellColor
        backView.layer.cornerRadius = 20
        backView.clipsToBounds = true

        openArticleButton.backgroundColor = Constants.Colors.favoriteCellColor
        openArticleButton.layer.cornerRadius = 6
        openArticleButton.clipsToBounds = true
    }
}
