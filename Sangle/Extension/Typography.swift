import SwiftUI

struct Typography {
    enum Style {
        case title1,
             title2, title2Emphasized,
             title3, title3Emphasized,
             subtitle1, subtitle1Emphasized,
             subtitle2, subtitle2Emphasized,
             body1, body1Emphasized, body2, body2Emphasized
        
        var fontSize: CGFloat {
            switch self {
            case .title1: return 24
            case .title2, .title2Emphasized: return 22
            case .title3, .title3Emphasized: return 20
            case .subtitle1, .subtitle1Emphasized: return 18
            case .subtitle2, .subtitle2Emphasized: return 16
            case .body1, .body1Emphasized: return 14
            case .body2, .body2Emphasized: return 13
            }
        }
        
        var lineHeight: CGFloat {
            switch self {
            case .title1: return 32
            case .title2, .title2Emphasized: return 30
            case .title3, .title3Emphasized: return 28
            case .subtitle1, .subtitle1Emphasized: return 24
            case .subtitle2, .subtitle2Emphasized: return 22
            case .body1, .body1Emphasized: return 20
            case .body2, .body2Emphasized: return 18
            }
        }
        
        var letterSpacing: CGFloat {
            let ratio = 0.0
            
            return fontSize * ratio
        }
        
        var fontName: String {
            switch self {
            case .title1, .title2Emphasized, .title3Emphasized, .subtitle1Emphasized, .subtitle2Emphasized, .body1Emphasized, .body2Emphasized:
                return "WantedSans-SemiBold"
            case .title2, .title3, .subtitle1, .subtitle2, .body1, .body2:
                return "WantedSans-Medium"
            }
        }
    }
}

// Typography Environment Key
struct TypographyEnvironmentKey: EnvironmentKey {
    static let defaultValue: (Typography.Style, Color) -> Font = { style, color in
        return Font.custom(style.fontName, size: style.fontSize)
    }
}

extension EnvironmentValues {
    var typography: (Typography.Style, Color) -> Font {
        get { self[TypographyEnvironmentKey.self] }
        set { self[TypographyEnvironmentKey.self] = newValue }
    }
}

struct TypographyModifier: ViewModifier {
    let style: Typography.Style
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(style.fontName, size: style.fontSize))
            .foregroundStyle(color)
            .lineSpacing((style.lineHeight - style.fontSize) / 2)
            .padding(.vertical, (style.lineHeight - style.fontSize) / 4)
            .kerning(style.letterSpacing)
            .fixedSize(horizontal: false, vertical: true)
    }
}

extension View {
    func typography(_ style: Typography.Style, color: Color = .primary) -> some View {
        self.modifier(TypographyModifier(style: style, color: color))
    }
}
