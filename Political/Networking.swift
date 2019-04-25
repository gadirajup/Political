//
//  Networking.swift
//  Political
//
//  Created by Prudhvi Gadiraju on 4/24/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import Foundation

class Networking {
    static func fetchPetitions(completion: @escaping (Result<Petitions, Error>) -> ()) {
        let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, reponse, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else { return }
            
            do {
                let petitions = try JSONDecoder().decode(Petitions.self, from: data)
                completion(.success(petitions))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
