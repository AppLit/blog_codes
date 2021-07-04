//
//  DSColor.swift
//  DesignSystem
//
//  Created by AppLit
//

import SwiftUI

public enum DSColor: String {
  
  // MARK: Base Colors
  case blue400 = "blue-400"
  case gray100 = "gray-100"
  case gray200 = "gray-200"
  case gray300 = "gray-300"
  case gray700 = "gray-700"
  case gray800 = "gray-800"
  case gray900 = "gray-900"
  case green400 = "green-400"
  case green800 = "green-800"
  case orange100 = "orange-100"
  case red200 = "red-200"
  case red500 = "red-500"

  // MARK: Theme Colors
  case background
  case primary
  case primaryDark
  case secondary
  case secondaryDark

  // MARK: Font Colors
  /// Accent Font Color
  case fontAccent
  /// Basic Font Color
  case fontBody
  /// Disabled Font Color
  case fontDisabled

  // MARK: Semantic Colors
  case danger
  case info
  case success
  case warning

}

extension DSColor {

  /// Default to black if the color does not exist in the design system.
  var color: Color {
    switch self {
    case .background:
      return .white
    case .primary:
      return DSColor.green400.color
    case .primaryDark:
      return DSColor.green800.color
    case .secondary:
      return DSColor.red200.color
    case .secondaryDark:
      return DSColor.red500.color
    case .fontAccent:
      return DSColor.secondaryDark.color
    case .fontBody:
      return DSColor.gray900.color
    case .fontDisabled:
      return DSColor.gray200.color
    case .danger:
      return DSColor.secondary.color
    case .info:
      return DSColor.blue400.color
    case .success:
      return DSColor.primary.color
    case .warning:
      return DSColor.orange100.color
    default:
      guard let uiColor = UIColor(named: rawValue) else {
        return .black
      }
      return Color(uiColor)
    }
  }

}

// MARK: - View Extension
extension View {

  /**
   Modifies a view's foreground color.
   
   - parameter dsColor: Themed color to change.
   */
  public func dsColor(_ dsColor: DSColor) -> some View {
    foregroundColor(dsColor.color)
  }

  /**
   Modifies a view's background color.
   
   - parameter dsColor: Themed color to change.
   */
  public func dsBackgroundColor(_ dsColor: DSColor) -> some View {
    background(dsColor.color)
  }

}

// MARK: - SwiftUI Preview
struct DSColor_Previews: PreviewProvider {
  
  private static let previewColors: [DSColor] = [
    .primary,
    .primaryDark,
    .secondary,
    .secondaryDark,
    .fontAccent,
    .fontBody,
    .fontDisabled,
    .danger,
    .info,
    .success,
    .warning
  ]

  static var previews: some View {
    List {
      ForEach(previewColors, id: \.rawValue) { dsColor in
        colorRect(dsColor)
          .listRowSeparator(.hidden)
      }
    }
    .listStyle(.plain)
    .dsBackgroundColor(.background)
  }

  private static func colorRect(_ dsColor: DSColor) -> some View {
    return HStack {
      Rectangle()
        .dsColor(dsColor)
        .frame(width: 50)
      Text(dsColor.rawValue)
        .dsColor(.fontBody)
    }
    .frame(height: 50)
  }

}
