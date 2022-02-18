//
//  ArticleWebViewController.swift
//  NewYorkTimes
//
//  Created by Xenia Sidorova on 17.02.2022.
//

import UIKit
import WebKit

class ArticleWebViewController: UIViewController, WKNavigationDelegate {
    private var articleWebView: WKWebView!
    var article: Result?

    override func loadView() {
        articleWebView = WKWebView()
        articleWebView.navigationDelegate = self
        view = articleWebView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Article"
        if let article = article {
            guard let url = URL(string: article.url) else { return }
            articleWebView.load(URLRequest(url: url))
            articleWebView.allowsBackForwardNavigationGestures = true
        }
    }
}
