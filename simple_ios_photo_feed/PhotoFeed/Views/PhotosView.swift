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
        ForEach(photosViewModel.photos, content: { photo in
          PhotoView(photo: photo)
        })
      }
    }
  }
  
}

struct PhotosView_Previews: PreviewProvider {
  
  static var previews: some View {
    PhotosView()
  }
  
}
