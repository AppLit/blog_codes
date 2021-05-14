//
//  PhotoSourceViewModel.swift
//  PhotoFeed
//
//  Created by AppLit

import Combine
import SwiftUI

class PhotoSourceViewModel: ObservableObject {
  
  @Published var image: UIImage? = nil {
    didSet {
      loading = false
    }
  }
  @Published var loading: Bool = true
  
  private let imageController: ImageController
  private let photoSource: PhotoSource
  
  private var cancellables: Set<AnyCancellable> = []
  
  init(
    photoSource: PhotoSource,
    imageController: ImageController = ImageController()
  ) {
    self.photoSource = photoSource
    self.imageController = imageController
    
    loadImage()
  }
  
  /**
   Download the iamge and store in this view model.
   */
  private func loadImage() {
    loading = true
    imageController.image(for: photoSource.medium)
      .receive(on: RunLoop.main)
      .assign(to: \.image, on: self)
      .store(in: &cancellables)
  }
  
}
