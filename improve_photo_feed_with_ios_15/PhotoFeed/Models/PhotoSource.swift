//
//  PhotoSource.swift
//  PhotoFeed
//
//  Created by AppLit
//

/**
 Models the response provided by
 https://www.pexels.com/api/documentation/#photos-overview__response__src
 */
struct PhotoSource: Decodable {

  var original: String
  var large2x: String
  var large: String
  var medium: String
  var small: String
  var portrait: String
  var landscape: String
  var tiny: String

}
