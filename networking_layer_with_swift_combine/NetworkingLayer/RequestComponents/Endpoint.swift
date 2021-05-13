//
//  Endpoint.swift
//  NetworkingLayer
//
//  Create by AppLit
//

import Foundation

public protocol Endpoint {
 
  /**
   Host of where we want to make the API call.
   */
  var host: String { get }
  /**
   API call path.
   */
  var path: String { get }
  var url: URL? { get }
 
  /**
   Headers specific to the endpoint.
   */
  var headers: HTTPHeaders? { get }
  /**
   GET, POST, PUT, PATCH, DELETE
   */
  var httpMethod: HTTPMethod { get }
  /**
   Type of network call
   */
  var task: HTTPTask { get }
 
}
 
extension Endpoint {
 
  public var host: String { APIConfig.host }
  public var url: URL? { URL(string: "\(host)\(path)") }
 
  public var headers: HTTPHeaders? { nil }
 
}
