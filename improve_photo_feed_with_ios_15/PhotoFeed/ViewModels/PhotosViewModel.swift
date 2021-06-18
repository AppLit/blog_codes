//
//  PhotosViewModel.swift
//  PhotoFeed
//
//  Created by AppLit
//

import Combine
import SwiftUI

class PhotosViewModel: ObservableObject {

  @Published var photos: [Photo] = []

  private let pexelsController: PexelsController
  /**
   The offset from the end of the `photos` list that we should start loading
   new data.
   (i.e. Start loading new data if we are 5 indexes away from the end of the
   `photos` list)
   */
  private let loadOffset = 5

  private var cancellables: Set<AnyCancellable> = []
  private var currentSearchResponse: SearchResponse? = nil {
    didSet {
      photos += currentSearchResponse?.photos ?? []
    }
  }
  private var isLoading = false

  init(pexelsController: PexelsController = PexelsController()) {
    self.pexelsController = pexelsController
    loadPhotos(with: pexelsController.getNewSearchResponse())
  }

  /**
   Call `loadPhotos()` if we are running out of photos.
   
   - parameter index: Check if we need to load more photos at the given index.
   */
  func loadPhotosIfNeeded(index: Int) {
    let needsMorePhotos = index >= photos.count - loadOffset

    if let urlString = currentSearchResponse?.nextPage,
       needsMorePhotos && !isLoading {
      loadPhotos(with: pexelsController.getSearchResponse(urlString))
    }
  }

  /**
   Retrieves search response and saves it in the view model.
   
   - parameter with: The Publisher this method will create a Subscriber for.
   */
  func loadPhotos(with publisher: AnyPublisher<SearchResponse, Error>) {
    if isLoading {
      return
    }
    isLoading = true
    publisher
      .receive(on: RunLoop.main)
      .compactMap({ $0 })
      .catch({ error -> Just<SearchResponse?> in
        print(error.localizedDescription)
        return Just(nil)
      })
      .sink(receiveValue: { [weak self] searchResponse in
        self?.isLoading = false
        guard let searchResponse = searchResponse else {
          // Most likely caught an error, so we're getting a `nil` object.
          // Don't assign it to `self.currentSearchResponse` in the case that
          // `self.currentSearchResponse != nil` so we don't unset things.
          return
        }
        self?.currentSearchResponse = searchResponse
      })
      .store(in: &cancellables)
  }

}
