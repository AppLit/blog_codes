//
//  ImageController.swift
//  PhotoFeed
//
//  Created by AppLit
//

import Combine
import UIKit

class ImageController {

  /**
   Downloads image given a valid URL.
   
   - parameter url: Image url.
   */
  func image(for url: String) -> AnyPublisher<UIImage?, Never> {
    guard let url = URL(string: url) else {
      return Just(nil).eraseToAnyPublisher()
    }

    return URLSession.shared.dataTaskPublisher(for: url)
      .map({ (data, _) -> UIImage? in
        guard let image = UIImage(data: data) else {
          return nil
        }
        return image
      })
      .replaceError(with: nil)
      .eraseToAnyPublisher()
  }

}
