//
//  RemoteFeedLoaderTest.swift
//  Essential FeedsTests
//
//  Created by Khan on 07.03.2024.
//

import Foundation
import XCTest

class RemoteFeedLoader {
    
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
   
}

class HTTPClient {
    static var shared = HTTPClient()
 
    
    func get(from url: URL) { }
    var requestedURL: URL?
}

class HTTPClientSpy: HTTPClient {
    override func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTest: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client

        let sut = RemoteFeedLoader()
      
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
