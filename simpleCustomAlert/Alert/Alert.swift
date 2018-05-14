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

    var alertView: UIView = {
        let alertView = UIView()
        alertView.frame = AppSize.window
        alertView.backgroundColor = .gray
        alertView.alpha = 0.7
        return alertView
    }()
    
    var buttonType = AlertControllerType.SingleButton("")
    
    typealias AlertAction = (_ action: AlertActions ) -> ()
    var handler: AlertAction?
    
    static let contentViewRect: CGRect = CGRect(x: AppSize.screenWidth / 2, y: AppSize.screenHeight / 2,
                                                width: AppSize.screenWidth / 1.2, height: AppSize.screenHeight / 2)

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
        alpha = hidden ? 0 : 1
        
        UIView.animate(withDuration: 0.2, animations: {
            self.view.alpha = alpha
        }) { _ in
            completed?()
        }
        
    }
    
    
    func addSingleButton(title: String) {
        let contentView = AlertView(title: "Title", message: "Messsage").setUpSingleAlert()
//        let contentView = SimpleFlatAlert(title: "Title", message: "Messsage").setUpSingleAlert()
        
        let view = self.alertView

        self.view.addSubview(view)
        self.view.addSubview(contentView)
    }

    func addDoubleButton(_ cancelTitle: String, _ acceptTitle: String) {
        
        let contentView = AlertView(title: "Title", message: "Messsage").setUpDoubleAlert()
        let view = self.alertView
        
        self.view.addSubview(view)
        self.view.addSubview(contentView)
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
        alert.buttonType = .SingleButton(buttonTitle)
        alert.handler = handler
        alert.view.backgroundColor = UIColor.clear
        alert.modalPresentationStyle = .overCurrentContext
        alert.modalTransitionStyle = .flipHorizontal

        vc.present(alert, animated: true, completion: nil)
    }
    
    class func show(_ vc: UIViewController, title: String, message: String, cancelTitle: String, acceptTitle: String, handler: AlertAction?) {
        let alert = Alert()        
        alert.buttonType = .DoubleButton(cancelTitle, acceptTitle)
        alert.handler = handler
        alert.view.backgroundColor = UIColor.clear
        alert.modalPresentationStyle = .overCurrentContext
        alert.modalTransitionStyle = .flipHorizontal

        vc.present(alert, animated: true, completion: nil)
    }
}

