//
//  DSTypography.swift
//  DesignSystem
//
//  Created by AppLit.
//

import SwiftUI

// swiftlint:disable identifier_name
public enum DSTypography {
  
  enum Style: String {
    case regular = "DMSans-Regular"
    case medium = "DMSans-Medium"
    case bold = "DMSans-Bold"
  }
  
  struct Properties {
    var color: DSColor
    var style: Style
    var size: CGFloat
    var systemRelative: Font.TextStyle
  }
  
  // Title
  case title
  case h1, h2, h3
  // Subtitles
  case s1, s2
  // Body
  case b1, b2
  // Caption
  case c1, c2
  // Links
  case link
  
  var properties: Properties {
    switch self {
    case .title: return Properties(color: .fontBody,
                                   style: .bold,
                                   size: 34.0,
                                   systemRelative: .largeTitle)
    case .h1: return Properties(color: .fontBody,
                                style: .bold,
                                size: 28.0,
                                systemRelative: .title)
    case .h2: return Properties(color: .fontBody,
                                style: .bold,
                                size: 22.0,
                                systemRelative: .title2)
    case .h3: return Properties(color: .fontBody,
                                style: .bold,
                                size: 20.0,
                                systemRelative: .title3)
    case .s1: return Properties(color: .fontBody,
                                style: .medium,
                                size: 17.0,
                                systemRelative: .headline)
    case .s2: return Properties(color: .fontBody,
                                style: .regular,
                                size: 15.0,
                                systemRelative: .subheadline)
    case .b1: return Properties(color: .fontBody,
                                style: .regular,
                                size: 17.0,
                                systemRelative: .body)
    case .b2: return Properties(color: .fontBody,
                                style: .regular,
                                size: 13.0,
                                systemRelative: .callout)
    case .c1: return Properties(color: .fontBody,
                                style: .regular,
                                size: 12.0,
                                systemRelative: .caption)
    case .c2: return Properties(color: .fontBody,
                                style: .regular,
                                size: 11.0,
                                systemRelative: .caption2)
    case .link: return Properties(color: .fontAccent,
                                  style: .regular,
                                  size: 17.0,
                                  systemRelative: .body)
    }
  }
  
}

// MARK: - View Extension
extension View {
  
  /**
   Modifies a view's typography.
   
   - parameter dsTypography: Themed typography to change.
   */
  public func dsTypography(_ dsTypography: DSTypography) -> some View {
    font(.custom(dsTypography.properties.style.rawValue,
                 size: dsTypography.properties.size,
                 relativeTo: dsTypography.properties.systemRelative))
      .dsColor(dsTypography.properties.color)
  }
  
}

// MARK: - SwiftUI Preview
struct DSTypography_Previews: PreviewProvider {
  
  static var previews: some View {
    VStack(alignment: .center, spacing: 8.0) {
      Group {
        Text("Main").font(.largeTitle)
        Text("Title").dsTypography(.title)
        Text("Title").dsTypography(.h1)
        Text("Title").dsTypography(.h2)
        Text("Title").dsTypography(.h3)
      }
      Group {
        Text("Subtitle").dsTypography(.s1)
        Text("Subtitle").dsTypography(.s2)
      }
      Group {
        Text("Body").dsTypography(.b1)
        Text("Body").dsTypography(.b2)
      }
      Group {
        Text("Caption").dsTypography(.c1)
        Text("Caption").dsTypography(.c2)
      }
      Group {
        Text("Link").dsTypography(.link)
      }
    }
    .padding()
  }
  
}
