//
//  PhotosView.swift
//  PhotoFeed
//
//  Created by AppLit
//

import SwiftUI

struct PhotosView: View {

  @ObservedObject private var photosViewModel = PhotosViewModel()

  var body: some View {
    ScrollView {
      LazyVStack {
        ForEach(
          Array(zip(photosViewModel.photos.indices, photosViewModel.photos)),
          id: \.0,
          content: { (index, photo) in
            PhotoView(photo: photo)
              .onAppear {
                photosViewModel.loadPhotosIfNeeded(index: index)
              }
          }
        )
      }
    }
  }

}

struct PhotosView_Previews: PreviewProvider {

  static var previews: some View {
    PhotosView()
  }

}
