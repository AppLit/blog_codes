//
//  PhotoSourceView.swift
//  PhotoFeed
//
//  Created by Alton Lau on 5/19/21.
//

import SwiftUI

struct PhotoSourceView: View {
  
  @ObservedObject private var photoSourceViewModel: PhotoSourceViewModel
  
  private let loadingColor: Color
  
  var body: some View {
    if photoSourceViewModel.loading {
      Rectangle()
        .fill(loadingColor)
    } else if let image = photoSourceViewModel.image {
      Image(uiImage: image)
        .resizable()
    } else {
      Image("applit")
        .resizable()
    }
  }
  
  init(photoSource: PhotoSource, loadingColor: Color) {
    self.loadingColor = loadingColor
    self.photoSourceViewModel = PhotoSourceViewModel(photoSource: photoSource)
  }
  
}
