import UIKit

extension UIColor {
    convenience init(rgbColorCodeRed red: Float, green: Float, blue: Float, alpha: Float) {
        let redPart: CGFloat = CGFloat(red) / 255
        let greenPart: CGFloat = CGFloat(green) / 255
        let bluePart: CGFloat = CGFloat(blue) / 255
        let opacity: CGFloat = CGFloat(alpha) / 1
        self.init(red: redPart, green: greenPart, blue: bluePart, alpha: opacity)
    }
    var coreImageColor: CIColor {
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreImageColor = self.coreImageColor
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}
