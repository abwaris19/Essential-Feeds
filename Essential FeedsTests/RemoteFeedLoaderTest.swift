//
//  RemoteFeedLoaderTest.swift
//  Essential FeedsTests
//
//  Created by Khan on 07.03.2024.
//

import Foundation
import XCTest

class RemoteFeedLoader {
    
   
}

class HTTPClient {
    var requestedURL: URL?
}
class RemoteFeedLoaderTest: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        
        XCTAssertNil(client.requestedURL)
    }
}
