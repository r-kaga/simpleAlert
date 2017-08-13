import UIKit

enum CustomAlertAction {
    case Accept
    case Cancel
}

class CustomAlert: UIViewController {
    
    typealias AlertAction = (_ action: CustomAlertAction) -> ()
    var handler: AlertAction?
    
    func animationContentView(hidden: Bool, completed: (()->())? = nil) {
        let alpha: CGFloat
        if hidden { alpha = 0 }
        else { alpha = 1 }
        
        UIView.animate(withDuration: 0.2, animations: {
            self.view.alpha = alpha
        }) { _ in
            completed?()
        }
        
    }
    
    
}


/**
 *  Button actions ---------------------
 */
extension CustomAlert {
    
    func acceptButtonTapped() {
        self.animationContentView(hidden: true) {
            self.handler?(.Accept)
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    func cancelButtonTapped() {
        self.animationContentView(hidden: true) {
            self.handler?(.Cancel)
            self.dismiss(animated: false, completion: nil)
        }
    }
}




extension UIColor {
    
    class func hexStr ( hexStr : NSString, alpha : CGFloat) -> UIColor {
        var hexStr = hexStr
        let alpha = alpha
        hexStr = hexStr.replacingOccurrences(of: "#", with: "") as NSString
        let scanner = Scanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.white;
        }
    }
    
}
