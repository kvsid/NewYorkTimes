//
//  ArticlesViewModel.swift
//  NewYorkTimes
//
//  Created by Xenia Sidorova on 15.02.2022.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let uri: String
    let url: String
    let id, assetID: Int
    let publishedDate, updated, section, subsection: String
    let nytdsection, adxKeywords: String
    let byline: String
    let title, abstract: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]
    let media: [Media]
    let etaID: Int

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case byline, title, abstract // column, type
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }

    func asJSON() -> String? {
        do {
            let jsonData = try JSONEncoder().encode(self)
            return String(data: jsonData, encoding: .utf8)!
        } catch {
            return nil
        }
    }
}

// MARK: - Media
struct Media: Codable {
    let mediaMetadata: [MediaMetadatum]

    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String
}
