//
//  APIService.swift
//  List
//
//  Created by Aghish Babu on 16/02/22.
//

import Foundation


class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "https://swapi.dev/api/planets/")!
    
    /// Closure Method for network call to fetch planets

    func apiToGetPlanetData(completion : @escaping (PlanetsData) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let planetData = try! jsonDecoder.decode(PlanetsData.self, from: data)
                    completion(planetData)
            }
        }.resume()
    }
}
