//
//  HTTPClient.swift
//  Essential Feeds
//
//  Created by Khan on 30.04.2024.
//

import Foundation
public enum HTTPClientResult {
    case success (Data, HTTPURLResponse)
    case failure(Error)
}
public protocol HTTPClient {
   
    func get(from url: URL, completion: @escaping (Error?, HTTPURLResponse?) -> Void)
    
}


