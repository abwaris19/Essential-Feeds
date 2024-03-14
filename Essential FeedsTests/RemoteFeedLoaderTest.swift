//
//  RemoteFeedLoaderTest.swift
//  Essential FeedsTests
//
//  Created by Khan on 07.03.2024.
//

import Foundation
import XCTest

class RemoteFeedLoader {
    
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func load() {
        client.get(from: URL(string: "https://a-url.com")!)
    }
   
}

protocol HTTPClient {
   
    func get(from url: URL)
    
}

class HTTPClientSpy: HTTPClient {
     func get(from url: URL) {
        requestedURL = url
    }
    var requestedURL: URL?
}

class RemoteFeedLoaderTest: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
        
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
      
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
