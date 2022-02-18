//
//  UserDefaults.swift
//  NewYorkTimes
//
//  Created by Xenia Sidorova on 18.02.2022.
//

import Foundation

class ArticlesStorage: UserDefaults {
    let prefix = "article::"

    func save(article: Result) {
        setValue(article.asJSON(), forKey: "\(prefix)\(article.id)")
    }

    func remove(id: Int) {
        removeObject(forKey: "\(prefix)\(id)")
    }

    func isSaved(id: Int) -> Bool {
        return object(forKey: "\(prefix)\(id)") != nil
    }

    func fetchAll() -> [Result] {
        let dictionary = dictionaryRepresentation().filter { (key, _) -> Bool in key.contains(prefix) }
        let articlesList = dictionary.map({$0.value as? String})
        var results: [Result] = []

        do {
            for article in articlesList {
                if let article = article {
                    results.append(try JSONDecoder().decode(Result.self, from: Data(article.utf8)))
                }
            }
        } catch {
            return results
        }
        return results
    }
}
