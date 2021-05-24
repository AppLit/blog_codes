//
//  PhotoView.swift
//  PhotoFeed
//
//  Created by AppLit
//

import SwiftUI

struct PhotoView: View {

  private var photo: Photo

  var body: some View {
    VStack(alignment: .trailing, content: {
      PhotoSourceView(
        photoSource: photo.src,
        loadingColor: Color(hex: photo.avgColor)
      )
        .padding()
        .scaledToFit()
      Text(photo.photographer)
        .padding()
    })
    .overlay(
      RoundedRectangle(cornerRadius: 8.0)
        .stroke(Color.secondary)
    )
    .padding()
  }

  init(photo: Photo) {
    self.photo = photo
  }

}
