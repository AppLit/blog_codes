//
//  PexelsController.swift
//  PhotoFeed
//
//  Created by AppLit
//

import Combine
import Foundation

class PexelsController {

  // Not the best way to store an API key, but for this example, it's okay.
  private let apiKey = "API_KEY_HERE"
  private let host = "https://api.pexels.com"
  private let path = "/v1/search"

  /**
   Performs a search query with Pexels for cars using a default url.
   */
  func getNewSearchResponse() -> AnyPublisher<SearchResponse, Error> {
    var components = URLComponents(string: "\(host)\(path)")
    components?.queryItems = [
      URLQueryItem(name: "query", value: "cars")
    ]
    return getSearchResponse(components?.string ?? "")
  }

  /**
   Performs a search query with Pexels for custom urls.
   
   - parameter urlString: String url for a GET request.
   */
  func getSearchResponse(
    _ urlString: String
  ) -> AnyPublisher<SearchResponse, Error> {
    guard let url = URL(string: urlString) else {
      return Fail(error: PexelsError.invalidURL)
        .eraseToAnyPublisher()
    }
    var request = URLRequest(url: url)
    request.addValue(apiKey, forHTTPHeaderField: "Authorization")

    return URLSession.shared.dataTaskPublisher(for: request)
      .tryMap(\.data)
      .decode(type: SearchResponse.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }

}

extension PexelsController {

  enum PexelsError: Error {
    case invalidURL
  }

}
