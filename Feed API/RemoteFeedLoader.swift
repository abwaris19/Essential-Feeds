//
//  RemoteFeedLoader.swift
//  Essential Feeds
//
//  Created by Khan on 26.03.2024.
//

import Foundation



public protocol HTTPClient {
   
    func get(from url: URL)
    
}


public final class RemoteFeedLoader {
    private  let url: URL
    private let  client: HTTPClient
   
    
    public  init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load() {
        client.get(from: url)
    }
   
}
