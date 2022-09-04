//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Vlad V on 04.09.2022.
//

import Foundation

class NetworkManager: ObservableObject {
    
    //@Published var posts = [Post]()
    @Published var posts: [Post] = [] // The same
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let e = error{
                    print(e.localizedDescription)
                } else {
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                            let results = try decoder.decode(Result.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
