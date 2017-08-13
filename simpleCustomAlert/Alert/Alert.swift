import UIKit

enum AlertControllerType {
    case SingleButton(String)
    case DoubleButton(String, String)
}

enum AlertActions {
    case Cancel
    case Accept
}

class Alert: UIViewController {
    
    var contentView = UIView()
    
    var alertView = UIView()
    
    var effectBlurVie = UIVisualEffectView()

    
    var singleButtonView = UIView()
    var singleViewAcceptButton = UIButton()
    
    
    var doubleButtonView = UIView()
    
    var doubleViewCancelButton = UIButton()
    var doubleViewAcceptButton = UIButton()
    
    var titleText: String = ""
    var messageText: String = ""
    
    var buttonType = AlertControllerType.SingleButton("")
    
    static var effect = UIBlurEffect(style: UIBlurEffectStyle.dark)
    static var effectView : UIVisualEffectView!
    
    typealias AlertAction = (_ action: AlertActions ) -> ()
    var handler: AlertAction?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch buttonType {
        case let .SingleButton(title) :
            addSingleButton(title: title)
            
        case let .DoubleButton(cancel, accept) :
            addDoubleButton(cancel, accept)
        }
        
        animationContentView(hidden: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animationContentView(hidden: false)
    }
    
    
    
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
    
    
    func addSingleButton(title: String) {
        
        print(AppSize.screenHeight)
        print(AppSize.screenWidth)
        
        print(AppSize.window)
        
        //        contentView.frame = CGRect(x: 0,
        //                                    y: 0,
        //                                    width: AppSize.screenWidth / 1.5,
        //                                    height: AppSize.screenHeight / 1.5)
        //
        //        contentView.center = CGPoint(x: AppSize.screenWidth / 2,
        //                                          y: AppSize.screenHeight / 2)
        //
        //		singleButtonView.frame = CGRect(x: 0,
        //		                                y: 0,
        //		                                width: contentView.frame.width,
        //		                                height: singleButtonView.frame.height)
        //
        //		singleButtonView.center = CGPoint(x: contentView.bounds.width / 2,
        //		                                  y: contentView.bounds.maxY - singleButtonView.bounds.height / 2)
        //        singleViewAcceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        //
        //
        //		contentView.addSubview(singleButtonView)
        //        self.view.addSubview(contentView)
        //
        
        let app = UIApplication.shared.delegate as! AppDelegate
        alertView.frame = AppSize.window
        alertView.backgroundColor = .white
        alertView.alpha = 0.2
        
        app.window?.addSubview(alertView)
        //
        //
        //        singleViewAcceptButton.setTitle(title, for: .normal)
        //        singleViewAcceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        
        
        
        
        
    }
    
    
    func addDoubleButton(_ cancelTitle: String, _ acceptTitle: String) {
        
        doubleButtonView.frame = CGRect(x: 0,
                                        y: 0,
                                        width: doubleButtonView.frame.width,
                                        height: doubleButtonView.frame.height)
        
        doubleButtonView.center = CGPoint(x: contentView.bounds.width / 2,
                                          y: contentView.bounds.maxY - doubleButtonView.bounds.height / 2)
        
        
        
        doubleViewCancelButton.setTitle(cancelTitle, for: .normal)
        doubleViewAcceptButton.setTitle(acceptTitle, for: .normal)
        
        
        
        
        //		doubleViewCancelButton.setTitle(title, for: .normal)
        //		doubleViewCancelButton.backgroundColor = UIColor.white
        //		doubleViewCancelButton.setTitle("Cancel", for: .normal)
        //		doubleViewCancelButton.setTitleColor(UIColor.blue, for: .normal)
        //		doubleViewCancelButton.layer.borderColor = UIColor.blue.cgColor
        //		doubleViewCancelButton.layer.masksToBounds = true
        //		doubleViewCancelButton.layer.cornerRadius = 20.0
        //		doubleViewCancelButton.layer.borderWidth = 0.5
        //
        //
        //		doubleViewAcceptButton.setTitle(title, for: .normal)
        //		doubleViewAcceptButton.backgroundColor = UIColor.blue
        //		doubleViewAcceptButton.layer.masksToBounds = true
        //		doubleViewAcceptButton.setTitle("OK", for: .normal)
        //		doubleViewAcceptButton.setTitleColor(UIColor.white, for: .normal)
        //		doubleViewAcceptButton.layer.cornerRadius = 20.0
        //		doubleViewAcceptButton.layer.borderWidth = 0.5
        //
        //
        //		contentView.backgroundColor = UIColor.hexStr(hexStr: "#72acff", alpha: 1)
        
        contentView.addSubview(doubleButtonView)
        
        doubleViewAcceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        doubleViewCancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


/**
 *  Button actions ---------------------
 */
extension Alert {
    
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


/**
 *  Show ---------------------
 */
extension Alert {
    
    class func show(_ vc: UIViewController, title: String, message: String, buttonTitle: String, handler: AlertAction?) {
        
        //		guard let alert = UIStoryboard(name: "MyAlertController", bundle: nil).instantiateInitialViewController()
        //			as? MyAlertController else { return }
        
        let alert = Alert()
        
        alert.titleText = title
        alert.messageText = message
        alert.buttonType = .SingleButton(buttonTitle)
        alert.handler = handler
        alert.modalPresentationStyle = .overCurrentContext

        vc.present(alert, animated: false, completion: nil)
    }
    
    class func show(_ vc: UIViewController, title: String, message: String, cancelTitle: String, acceptTitle: String, handler: AlertAction?) {

        let alert = Alert()        
        alert.titleText = title
        alert.messageText = message
        alert.buttonType = .DoubleButton(cancelTitle, cancelTitle)
        alert.handler = handler
        alert.modalPresentationStyle = .overCurrentContext
        vc.present(alert, animated: true, completion: nil)
    }
}



//extension UIColor {
//    class func hexStr (hexStr : NSString, alpha : CGFloat) -> UIColor {
//        var hexStr = hexStr
//        let alpha = alpha
//        hexStr = hexStr.replacingOccurrences(of: "#", with: "") as NSString
//        let scanner = Scanner(string: hexStr as String)
//        var color: UInt32 = 0
//        if scanner.scanHexInt32(&color) {
//            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
//            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
//            let b = CGFloat(color & 0x0000FF) / 255.0
//            return UIColor(red:r,green:g,blue:b,alpha:alpha)
//        } else {
//            print("invalid hex string")
//            return UIColor.white;
//        }
//    }
//}
