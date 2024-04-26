//
//  RemoteFeedLoader.swift
//  Essential Feeds
//
//  Created by Khan on 26.03.2024.
//

import Foundation

public enum HTTPClientResult {
    case success (Data, HTTPURLResponse)
    case failure(Error)
}
public protocol HTTPClient {
   
    func get(from url: URL, completion: @escaping (Error?, HTTPURLResponse?) -> Void)
    
}


public final class RemoteFeedLoader {
    private  let url: URL
    private let  client: HTTPClient
   
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public enum Result: Equatable {
        case success ([FeedItem])
        case failure(Error)
    }
    
    public  init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load( completion: @escaping (Result) -> Void ) {
        client.get(from: url) { result  in
            
            switch result
            {
            case let .success(data, response):
                if response.statusCode == 200,
                if let root = try?
                    JSONDecoder().decode(Root.self, from: data) {
                    completion(.success([root.items]))
                }
                completion(.failure(.invalidData))
            case .failure:
                completion(.failure(.connectivity))
            }
            
           
          
            
        }
    }
   
}

private struct Root: Decoder {
    let items: [FeedItem]
}
