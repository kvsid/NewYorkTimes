//
//  NetworkService.swift
//  NewYorkTimes
//
//  Created by Xenia Sidorova on 17.02.2022.
//

import UIKit

class NetwokService {

    func requestArticles(completion: @escaping ([Result]) -> Void) {
        guard let url = URL(string: Constants.URL.baseURL) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, response != nil else {
                print("Something went wrong. The data nil")
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(Welcome.self, from: data)
                completion(decodedData.results)
            } catch {
                print("Something went wrong")
            }
        }.resume()
    }
}
