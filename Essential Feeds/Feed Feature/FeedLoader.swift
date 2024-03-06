//
//  FeedLoader.swift
//  Essential Feeds
//
//  Created by Khan on 06.03.2024.
//

import Foundation


enum LoadFeedResult {
    case success ([FeedItem])
    case error (Error)
}
protocol FeedLoader {
    func load(completion: @escaping(LoadFeedResult) -> Void)
}
