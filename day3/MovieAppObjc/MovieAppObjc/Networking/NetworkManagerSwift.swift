//
//  NetworkManagerSwift.swift
//  MovieAppObjc
//
//  Created by Christian Quicano on 2/25/22.
//

import Foundation

@objc class NetworkManagerSwift: NSObject {
    
    @objc func getMovie(from url: String, completion: @escaping ([Movie]) -> Void) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    // decode data in a dictionary
                    if let response = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let items = response["results"] as? [[String: Any]] {
                            var results = [Movie]()
                            for item in items {
                                let movie = Movie(from: item)
                                results.append(movie)
                            }
                            completion(results)
                        }
                    }
                } catch let error {
                    print(error)
                }
            }
            
            if let error = error {
                print(error)
            }
        }
        .resume()
        
    }
    
}
