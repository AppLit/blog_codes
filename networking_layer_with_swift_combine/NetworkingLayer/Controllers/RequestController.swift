//
//  RequestController.swift
//  NetworkingLayer
//
//  Create by AppLit
//

import Combine
import Foundation

protocol RequestControllerProtocol {
  
  /**
   Executes the set endpoint.
   
   - parameter endpoint: API endpoint.
   */
  func execute(_ endpoint: Endpoint) -> AnyPublisher<Data, Error>
  
}

final class RequestController {
  
  /**
   Builds a request by adding the proper header values and attaching parameters.
   
   - parameter endpoint: API endpoint.
   */
  private func makeRequest(with endpoint: Endpoint) throws -> URLRequest {
    guard let url = endpoint.url else { throw RequestError.invalidURL }
    var request = URLRequest(url: url)
    
    // Set HTTP method
    request.httpMethod = endpoint.httpMethod.rawValue
    
    // Add default headers
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // Add endpoint headers
    endpoint.headers?.forEach({
      request.addValue($0.value, forHTTPHeaderField: $0.key)
    })
    
    // Encode request parameters
    switch endpoint.task {
    case .request(let body, let query):
      // Add query parameters
      if let query = query {
        request.url = try queryUrl(for: request, with: query)
      }
      
      // Add body parameters
      if let body = body {
        request.httpBody = try data(for: body)
      }
    }
    
    return request
  }
  
  /**
   Retrieve `QueryParameters` and return a list of `URLQueryItems`
   
   - parameter queries: Query parameters to convert to `[URLQueryItem]`.
   */
  private func queryUrl(
    for request: URLRequest,
    with query: QueryParameters
  ) throws -> URL {
    guard let url = request.url,
          var components = URLComponents(url: url,
                                         resolvingAgainstBaseURL: false) else {
      throw RequestError.invalidURL
    }
    
    components.queryItems = query.map({ item in
      let name = item.key
      let value =
        item.value.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
      return URLQueryItem(name: name, value: value)
    })
    
    guard let updatedUrl = components.url else {
      throw RequestError.invalidParameters
    }
    return updatedUrl
  }
  
  /**
   Retrieve `BodyParameters` and encode into a JSON data.
   
   - parameter parameters: Dictionary of parameters to convert to JSON.
   */
  private func data(for body: BodyParameters) throws -> Data {
    do {
      return try JSONSerialization.data(withJSONObject: body)
    } catch {
      throw RequestError.invalidParameters
    }
  }
  
}

extension RequestController: RequestControllerProtocol {
  
  func execute(_ endpoint: Endpoint) -> AnyPublisher<Data, Error> {
    do {
      let request = try makeRequest(with: endpoint)
      return publisher(for: request)
        .eraseToAnyPublisher()
    } catch {
      return Fail(error: error).eraseToAnyPublisher()
    }
  }
  
  /**
   Executes the request, parses the error, and type erases to `AnyPublisher`.
   
   - parameter request: The request used for the network call.
   */
  private func publisher(for request: URLRequest) -> AnyPublisher<Data, Error> {
    typealias Response = HTTPURLResponse
    typealias ResponseError = HTTPURLResponse.HTTPURLResponseError

    return URLSession.shared.dataTaskPublisher(for: request)
      .tryMap({ result in
        guard let response = result.response as? Response else {
          // Cannot figure out what the response is
          throw ResponseError(status: .unableToDecode)
        }

        if response.status != .success {
          // Try to decode the error from the response
          if let error =
              try? JSONDecoder().decode(ResponseError.self, from: result.data) {
            throw error
          }
          // Throw a regular error based on response status
          throw ResponseError(status: response.status)
        }
        return result.data
      })
      .eraseToAnyPublisher()
  }
  
}
