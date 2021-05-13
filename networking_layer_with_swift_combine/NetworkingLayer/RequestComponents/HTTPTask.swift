//
//  HTTPTask.swift
//  NetworkingLayer
//
//  Create by AppLit
//

import Foundation

public enum HTTPTask {

  case request(body: BodyParameters? = nil,
               query: QueryParameters? = nil)
  
  // More types of tasks can be added here (i.e. download, file upload, etc...)

}
