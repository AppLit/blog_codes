//
//  APIConfig.swift
//  NetworkingLayer
//
//  Create by AppLit
//

import Foundation

struct APIConfig {
 
  static let environment: APIEnvironment = .production
  static var host: String {
    switch environment {
      case .production: return "https://www.applit.io"
      case .staging: return "https://staging.applit.io"
    }
  }
 
}
 
enum APIEnvironment {
 
  case production
  case staging
 
}
