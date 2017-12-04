import UIKit

extension UIColor {
    
    class var titleText: UIColor {
        return darkGray
    }
    
    class var bodyText: UIColor {
        return gray
    }
}

extension UIFont {
    
    class var title: UIFont {
        return preferredFont(forTextStyle: UIFontTextStyle.title1)
    }
    
    class var body: UIFont {
        return preferredFont(forTextStyle: UIFontTextStyle.body)
    }
    
}
