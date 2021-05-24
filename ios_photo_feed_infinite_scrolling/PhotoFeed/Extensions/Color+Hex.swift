//
//  Color+Hex.swift
//  PhotoFeed
//
//  Created by AppLit
//

import SwiftUI

extension Color {

  /**
   Attribution to https://gist.github.com/anonymous/fd07ecf47591c9f9ed1a
   Creates a `Color` given a hex string
   
   - parameter hex: The color in hex value.
   - parameter opacity: Opacity for the color.
   */
  init(hex: String, opacity: Double = 1) {
    let trimmedHex: String = {
      if hex.hasPrefix("#") {
        return String(hex.dropFirst())
      }
      return hex
    }()
    let scanner = Scanner(string: trimmedHex)
    var rgb: UInt64 = 0

    scanner.scanHexInt64(&rgb)

    self.init(
      .sRGB,
      red: Double((rgb & 0xFF0000) >> 16)/255.0,
      green: Double((rgb & 0xFF00) >>  8)/255.0,
      blue: Double((rgb & 0xFF))/255.0,
      opacity: opacity
    )
  }

}
