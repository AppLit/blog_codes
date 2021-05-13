//
//  HTTPURLResponseStatus.swift
//  NetworkingLayer
//
//  Create by AppLit
//

import Foundation

extension HTTPURLResponse {

  struct HTTPURLResponseError: Decodable, Error {

    let message: String

    init(message: String) {
      self.message = message
    }

    init(status: Status) {
      self.message = status.rawValue
    }

  }
  
  enum Status: String {
    case badRequest = "Bad request"
    case failed = "Network request failed."
    case redirect = "This request has been redirected."
    case success = "Success"
    case unableToDecode = "We could not decode the response."
    case unauthorized = "You need to be authenticated first."
  }

  var status: Status {
    switch statusCode {
    case 200...299: return .success
    case 300...399: return .redirect
    case 401...500: return .unauthorized
    case 400, 501...599: return .badRequest
    default: return .failed
    }
  }

}
