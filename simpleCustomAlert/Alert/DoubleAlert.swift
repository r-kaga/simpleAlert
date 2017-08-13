import UIKit

enum DoubleAlertAction {
    case Accept
    case Cancel
}

enum DoubleAlertControllerType {
    case DoubleButton(String, String)
}

class DoubleAlert: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var doubleViewCancelButton: UIButton!
    @IBOutlet weak var doubleViewAcceptButton: UIButton!

    var buttonType = DoubleAlertControllerType.DoubleButton("", "")
    
    var titleText: String = ""
    var messageText: String = ""
    
    typealias AlertAction = (_ action: DoubleAlertAction)->()
    var handler: AlertAction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doubleViewAcceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        doubleViewCancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        titleLabel.text = titleText
        messageLabel.text = messageText
        
//        addDoubleButton(cancelTitle: cancel, acceptTitle: accept)
        switch buttonType {
            case let .DoubleButton(cancel, accept) :
                addDoubleButton(cancelTitle: cancel, acceptTitle: accept)
        
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
  
    private func addDoubleButton(cancelTitle: String, acceptTitle: String) {
        
//        doubleViewCancelButton.setTitle(cancelTitle, for: .normal)
//        doubleViewAcceptButton.setTitle(acceptTitle, for: .normal)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


/**
 *  Button actions ---------------------
 */
extension DoubleAlert {
    
    func acceptButtonTapped() {
        animationContentView(hidden: true) {
            self.handler?(.Accept)
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    func cancelButtonTapped() {
        animationContentView(hidden: true) {
            self.handler?(.Cancel)
            self.dismiss(animated: false, completion: nil)
        }
    }
    
}


/**
 *  Show ---------------------
 */
extension DoubleAlert {
    

    /*
         DoubleAlert.show(presentintViewController: self, title: "タイトル", message: "メッセージを\n表示しています") { action in
             switch action {
                 case .Accept : print("accept!")
                 case .Cancel : print("cancel!")
             }
         }
     */
    class func show(_ vc: UIViewController, title: String, message: String, cancelTitle: String = "Cancel", acceptTitle: String = "OK", handler: AlertAction?) {
        guard let alert = UIStoryboard(name: "DoubleAlert", bundle: nil).instantiateInitialViewController()
            as? DoubleAlert else { return }
        alert.titleText = title
        alert.messageText = message
        alert.buttonType = .DoubleButton(cancelTitle, acceptTitle)
        alert.handler = handler
        
        vc.present(alert, animated: false, completion: nil)
    }
    
    
    
}
