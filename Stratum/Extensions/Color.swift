import SwiftUI
import Foundation

extension Color{
    static let theme = ColorTheme()
}
struct ColorTheme{
    let accent=Color("AccentColor")
    let background=Color("BackgroundColor")
    let Up=Color("UpColor")
    let Down=Color("DownColor")
    let secondaryText=Color("SecondaryTextColor")
}
