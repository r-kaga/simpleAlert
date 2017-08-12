import UIKit

enum SingleAlertAction {
    case Accept
}

enum MyAlertControllerType {
	case SingleButton(String)
	case DoubleButton(String, String)
}

class SingleAlert: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var singleViewAcceptButton: UIButton!

    var buttonType = MyAlertControllerType.SingleButton("")

    var titleText: String = ""
    var messageText: String = ""
    
    typealias AlertAction = (_ action: SingleAlertAction)->()
    var handler: AlertAction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        singleViewAcceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        
        titleLabel.text = titleText
        messageLabel.text = messageText
        
        print(title)
        addSingleButton(title: title ?? "OK")

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
    
    private func addSingleButton(title: String) {
//        singleViewAcceptButton.frame.origin = CGPoint(x: 0, y: 120)
//        contentView.addSubview(singleButtonView)
//        singleViewAcceptButton.setTitle(title, for: .normal)
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


/**
 *  Button actions ---------------------
 */
extension SingleAlert {
    
    func acceptButtonTapped() {
        animationContentView(hidden: true) {
            self.handler?(.Accept)
            self.dismiss(animated: false, completion: nil)
        }
    }

}


/**
 *  Show ---------------------
 */
extension SingleAlert {
    
    class func show(_ vc: UIViewController, title: String, message: String, buttonTitle: String, handler: AlertAction?) {
        guard let alert = UIStoryboard(name: "SingleAlert", bundle: nil).instantiateInitialViewController()
            as? SingleAlert else { return }
        alert.titleText = title
        alert.messageText = message
        alert.buttonType = .SingleButton(buttonTitle)
        alert.handler = handler
        
        vc.present(alert, animated: false, completion: nil)
    }
    
}
