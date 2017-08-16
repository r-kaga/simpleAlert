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
    
    var alertView = UIView()
    var contentView = UIView()

    var singleButtonView = UIView()
    var singleViewAcceptButton = UIButton()
    
    var doubleButtonView = UIView()
    
    var doubleViewCancelButton = UIButton()
    var doubleViewAcceptButton = UIButton()
    
    var titleText: String = ""
    var messageText: String = ""
    
    var titleLabel = UILabel()
    var messageLabel = UILabel()
    
    var alertImage = UIImageView()
    
    var buttonType = AlertControllerType.SingleButton("")
    
    
    typealias AlertAction = (_ action: AlertActions ) -> ()
    var handler: AlertAction?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        singleViewAcceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        doubleViewAcceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        doubleViewCancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
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

        contentView.frame = CGRect(x: 0,
                                    y: 0,
                                    width: AppSize.screenWidth / 1.2,
                                    height: AppSize.screenHeight / 2)

        contentView.center = CGPoint(x: AppSize.screenWidth / 2,
                                   y: AppSize.screenHeight / 2)
        
        contentView.backgroundColor = .white
        
        singleViewAcceptButton.frame = CGRect(x: 0,
                                           y: 0,
                                           width: contentView.bounds.width / 1.2 ,
                                           height: 50)
        
        singleViewAcceptButton.center = CGPoint(x: contentView.bounds.width / 2,
                                                y: contentView.bounds.maxY - singleViewAcceptButton.frame.height / 1.5)

        singleViewAcceptButton.backgroundColor = UIColor.hexStr(hexStr: "#72acff", alpha: 1)
        singleViewAcceptButton.setTitleColor(.black, for: .normal)
        singleViewAcceptButton.setTitle(title, for: .normal)
        singleViewAcceptButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)

        singleViewAcceptButton.layer.masksToBounds = true
        singleViewAcceptButton.layer.cornerRadius = 20.0
        
        contentView.addSubview(singleViewAcceptButton)
    
        
        
        titleLabel.frame = CGRect(x: 0,
                                y: 0,
                                width: AppSize.screenWidth,
                                height: AppSize.screenHeight / 2)
        
        titleLabel.center = CGPoint(x: contentView.bounds.width / 2,
                                  y: contentView.bounds.height / 2)
        
        titleLabel.text = titleText
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        
        contentView.addSubview(titleLabel)
    
        
        messageLabel.frame = CGRect(x: 0,
                                  y: 0,
                                  width: AppSize.screenWidth,
                                  height: AppSize.screenHeight / 2)
        
        messageLabel.center = CGPoint(x: contentView.bounds.width / 2,
                                    y: contentView.bounds.height / 1.5)
        
        messageLabel.text = messageText
        messageLabel.textColor = .gray
        messageLabel.textAlignment = .center
        
        contentView.addSubview(messageLabel)
        
        
        alertImage.frame = CGRect(x: 0,
                                y: 0,
                                width: 100,
                                height: 100)
        
        alertImage.center = CGPoint(x: contentView.bounds.width / 2,
                                      y: contentView.bounds.height / 4.0)
        
        let image = UIImage(named: "insert_comment.png")!
        alertImage.image = image
        
        contentView.addSubview(alertImage)
        
        alertView.frame = AppSize.window
        alertView.backgroundColor = .gray
        alertView.alpha = 0.7

        self.view.addSubview(alertView)
        self.view.addSubview(contentView)
        
    }
    
    
    func addDoubleButton(_ cancelTitle: String, _ acceptTitle: String) {
        
        contentView.frame = CGRect(x: 0,
                                   y: 0,
                                   width: AppSize.screenWidth / 1.2,
                                   height: AppSize.screenHeight / 2)
        
        contentView.center = CGPoint(x: AppSize.screenWidth / 2,
                                     y: AppSize.screenHeight / 2)
        
        contentView.backgroundColor = .white
        
        
        
        doubleButtonView.frame = CGRect(x: 0,
                                        y: 0,
                                        width: contentView.bounds.width,
                                        height: 50)
        
        doubleButtonView.center = CGPoint(x: contentView.bounds.width / 2,
                                          y: contentView.bounds.maxY - 30)
        
        

        doubleViewAcceptButton.frame = CGRect(x: 0,
                                              y: 0,
                                              width: doubleButtonView.bounds.width / 2 - 15,
                                              height: 50)
        
        doubleViewAcceptButton.center = CGPoint(x: doubleButtonView.bounds.midX + (doubleButtonView.bounds.width / 4) - 2,
                                                y: doubleButtonView.bounds.midY)
        
        doubleViewAcceptButton.backgroundColor = UIColor.hexStr(hexStr: "#72acff", alpha: 1)
        doubleViewAcceptButton.setTitleColor(.black, for: .normal)
        doubleViewAcceptButton.setTitle(title, for: .normal)
        doubleViewAcceptButton.setTitle(acceptTitle, for: .normal)
        
        doubleViewAcceptButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)

        doubleViewAcceptButton.layer.masksToBounds = true
        doubleViewAcceptButton.layer.cornerRadius = 5.0
        
        
        
        
        
        doubleViewCancelButton.frame = CGRect(x: 0,
                                              y: 0,
                                              width: doubleButtonView.bounds.width / 2 - 15,
                                              height: 50)
        
        doubleViewCancelButton.center = CGPoint(x:  doubleButtonView.bounds.midX - (doubleButtonView.bounds.width / 4) + 2,
                                             y: doubleButtonView.bounds.midY)
        
        doubleViewCancelButton.backgroundColor = .black
        doubleViewCancelButton.setTitleColor(.white, for: .normal)
        doubleViewCancelButton.setTitle(title, for: .normal)
        
        doubleViewCancelButton.setTitle(cancelTitle, for: .normal)

        doubleViewCancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        
        doubleViewCancelButton.layer.masksToBounds = true
        doubleViewCancelButton.layer.cornerRadius = 5.0
        

        
        
        
        doubleButtonView.addSubview(doubleViewAcceptButton)
        doubleButtonView.addSubview(doubleViewCancelButton)
        contentView.addSubview(doubleButtonView)
        
        
        titleLabel.frame = CGRect(x: 0,
                                  y: 0,
                                  width: AppSize.screenWidth,
                                  height: AppSize.screenHeight / 2)
        
        titleLabel.center = CGPoint(x: contentView.bounds.width / 2,
                                    y: contentView.bounds.height / 2)
        
        titleLabel.text = titleText
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        
        contentView.addSubview(titleLabel)
        
        
        messageLabel.frame = CGRect(x: 0,
                                    y: 0,
                                    width: AppSize.screenWidth,
                                    height: AppSize.screenHeight / 2)
        
        messageLabel.center = CGPoint(x: contentView.bounds.width / 2,
                                      y: contentView.bounds.height / 1.5)
        
        messageLabel.text = messageText
        messageLabel.textColor = .gray
        messageLabel.textAlignment = .center
        
        contentView.addSubview(messageLabel)
        
        
        
        
        
        
        
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
        
        
        alertImage.frame = CGRect(x: 0,
                                  y: 0,
                                  width: 100,
                                  height: 100)
        
        alertImage.center = CGPoint(x: contentView.bounds.width / 2,
                                    y: contentView.bounds.height / 4.0)
        
        let image = UIImage(named: "insert_comment.png")!
        alertImage.image = image
        
        contentView.addSubview(alertImage)
        
        alertView.frame = AppSize.window
        alertView.backgroundColor = .gray
        alertView.alpha = 0.7
        
        self.view.addSubview(alertView)
        self.view.addSubview(contentView)
        
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
        
        let alert = Alert()
        
        alert.titleText = title
        alert.messageText = message
        alert.buttonType = .SingleButton(buttonTitle)
        alert.handler = handler
        alert.view.backgroundColor = UIColor.clear
        alert.modalPresentationStyle = .overCurrentContext
        alert.modalTransitionStyle = .flipHorizontal

        vc.present(alert, animated: true, completion: nil)
    }
    
    class func show(_ vc: UIViewController, title: String, message: String, cancelTitle: String, acceptTitle: String, handler: AlertAction?) {

        let alert = Alert()        
        alert.titleText = title
        alert.messageText = message
        alert.buttonType = .DoubleButton(cancelTitle, acceptTitle)
        alert.handler = handler
        alert.view.backgroundColor = UIColor.clear
        alert.modalPresentationStyle = .overCurrentContext
        alert.modalTransitionStyle = .flipHorizontal

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
