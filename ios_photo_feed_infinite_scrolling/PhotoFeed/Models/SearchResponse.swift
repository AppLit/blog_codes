//
//  SearchResponse.swift
//  PhotoFeed
//
//  Created by AppLit
//

/**
 Models the response provided by
 https://www.pexels.com/api/documentation/#photos-search
 */
struct SearchResponse: Decodable {

  private enum CodingKeys: String, CodingKey {
    case totalResults = "total_results"
    case page
    case perPage = "per_page"
    case photos
    case nextPage = "next_page"
    case prevPage = "prev_page"
  }

  var totalResults: Int
  var page: Int
  var perPage: Int
  var photos: [Photo]
  var nextPage: String?
  var prevPage: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.totalResults = try container.decode(Int.self, forKey: .totalResults)
    self.page = try container.decode(Int.self, forKey: .page)
    self.perPage = try container.decode(Int.self, forKey: .perPage)
    self.photos = try container.decode([Photo].self, forKey: .photos)
    self.nextPage = try? container.decode(String.self, forKey: .nextPage)
    self.prevPage = try? container.decode(String.self, forKey: .prevPage)
  }

}
