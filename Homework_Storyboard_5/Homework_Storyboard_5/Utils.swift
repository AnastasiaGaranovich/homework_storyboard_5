import UIKit

extension UIColor {
    convenience init(rgbColorCodeRed red: Float, green: Float, blue: Float, alpha: Float) {
        let redPart: CGFloat = CGFloat(red) / 255
        let greenPart: CGFloat = CGFloat(green) / 255
        let bluePart: CGFloat = CGFloat(blue) / 255
        let opacity: CGFloat = CGFloat(alpha) / 1
        self.init(red: redPart, green: greenPart, blue: bluePart, alpha: opacity)
    }
}
