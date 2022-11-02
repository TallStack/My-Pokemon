//
//  RestAPI.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/28.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case taskError
    case invalidResponse
    case invalidStatusCode(Int)
    case noData
    case invalidJSON
}

final class RestAPI {
    
    enum RestAPIType {
        case pokemonList
        case pokemonDetail(id: String)
    }
    
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        configuration.timeoutIntervalForRequest = 30
        configuration.waitsForConnectivity = true
        return URLSession(configuration: configuration)
    }()

    private let baseURL = "https://pokeapi.co/api/v2/"
    private let requestType: RestAPIType

    private var path: String {
        switch requestType {
        case .pokemonList:
            return baseURL + "pokemon?limit=25&offset=0"
        case let .pokemonDetail(id):
            return baseURL + "pokemon/\(id)"
        }
    }
    
    init(requestType: RestAPIType) {
        self.requestType = requestType
    }

    func pokemonList(onComplete: @escaping (Result<PokemonList, APIError>) -> Void) {
        guard let url = URL(string: path) else {
            return onComplete(.failure(.invalidURL))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                onComplete(.failure(.taskError))
            }
            
            guard let response = response as? HTTPURLResponse else {
                return onComplete(.failure(.invalidResponse))
            }
            
            if response.statusCode != 200 {
                onComplete(.failure(.invalidStatusCode(response.statusCode)))
            }
            
            guard let data = data else {
                return onComplete(.failure(.noData))
            }
            
            do {
                let list = try JSONDecoder().decode(PokemonList.self, from: data)
                onComplete(.success(list))
            } catch {
                onComplete(.failure(.invalidJSON))
            }
        }
        task.resume()
    }
    
    func pokemonDetail(onComplete: @escaping (Result<PokemonDetail, APIError>) -> Void) {
        guard let url = URL(string: path) else {
            return onComplete(.failure(.invalidURL))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                onComplete(.failure(.taskError))
            }
            
            guard let response = response as? HTTPURLResponse else {
                return onComplete(.failure(.invalidResponse))
            }
            
            if response.statusCode != 200 {
                onComplete(.failure(.invalidStatusCode(response.statusCode)))
            }
            
            guard let data = data else {
                return onComplete(.failure(.noData))
            }
            
            do {
                let list = try JSONDecoder().decode(PokemonDetail.self, from: data)
                onComplete(.success(list))
            } catch {
                onComplete(.failure(.invalidJSON))
            }
        }
        task.resume()
    }
}
