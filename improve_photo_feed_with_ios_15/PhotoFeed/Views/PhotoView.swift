//
//  PhotoView.swift
//  PhotoFeed
//
//  Created by AppLit
//

import SwiftUI

struct PhotoView: View {
  
  @State private var imageWidth = CGFloat()
  private var imageHeight: CGFloat {
    return imageWidth * CGFloat(photo.height) / CGFloat(photo.width)
  }
  private var photo: Photo
  
  var body: some View {
    ZStack(alignment: .bottom) {
      AsyncImage(url: URL(string: photo.src.medium)) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fit)
      } placeholder: {
        Rectangle()
          .fill(Color(hex: photo.avgColor))
          .frame(width: imageWidth, height: imageHeight)
      }
      HStack {
        Text(photo.photographer)
        Spacer()
      }
      .padding()
      .background(.thinMaterial)
    }
    .overlay(GeometryReader { geometry in
      // This is used to calculate the estimated image size after all the padding
      // for sizing thte loading frame.
      Rectangle()
        .hidden()
        .task {
          self.imageWidth = geometry.size.width
        }
    })
    .background(.thickMaterial)
    .mask(RoundedRectangle(cornerRadius: 8.0))
    .padding([.leading, .trailing, .bottom])
  }
  
  init(photo: Photo) {
    self.photo = photo
  }
  
}
