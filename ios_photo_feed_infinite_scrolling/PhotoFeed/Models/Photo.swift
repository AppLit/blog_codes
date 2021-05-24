//
//  Photo.swift
//  PhotoFeed
//
//  Created by AppLit
//

/**
 Models the response provided by
 https://www.pexels.com/api/documentation/#photos-overview
 */
struct Photo: Decodable {

  private enum CodingKeys: String, CodingKey {
    case id
    case width
    case height
    case url
    case photographer
    case photographerUrl = "photographer_url"
    case photographerId = "photographer_id"
    case avgColor = "avg_color"
    case src
  }

  var id: Int
  var width: Int
  var height: Int
  var url: String
  var photographer: String
  var photographerUrl: String
  var photographerId: Int
  var avgColor: String
  var src: PhotoSource

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(Int.self, forKey: .id)
    self.width = try container.decode(Int.self, forKey: .width)
    self.height = try container.decode(Int.self, forKey: .height)
    self.url = try container.decode(String.self, forKey: .url)
    self.photographer =
      try container.decode(String.self, forKey: .photographer)
    self.photographerUrl =
      try container.decode(String.self, forKey: .photographerUrl)
    self.photographerId =
      try container.decode(Int.self, forKey: .photographerId)
    self.avgColor = try container.decode(String.self, forKey: .avgColor)
    self.src = try container.decode(PhotoSource.self, forKey: .src)
  }

}
