import UIKit


enum DoubleAlertControllerType {
    case DoubleButton(String, String)
}

class DoubleAlert: CustomAlert {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var doubleViewCancelButton: UIButton!
    @IBOutlet weak var doubleViewAcceptButton: UIButton!

    var buttonType = DoubleAlertControllerType.DoubleButton("", "")
    
    var titleText: String = ""
    var messageText: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doubleViewAcceptButton.addTarget(self, action: #selector(super.acceptButtonTapped), for: .touchUpInside)
        doubleViewCancelButton.addTarget(self, action: #selector(super.cancelButtonTapped), for: .touchUpInside)
        
        titleLabel.text = titleText
        messageLabel.text = messageText
        
//        addDoubleButton(cancelTitle: cancel, acceptTitle: accept)
        switch buttonType {
            case let .DoubleButton(cancel, accept) :
                addDoubleButton(cancelTitle: cancel, acceptTitle: accept)
        
        }
        
        super.animationContentView(hidden: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        super.animationContentView(hidden: false)
    }

  
    private func addDoubleButton(cancelTitle: String, acceptTitle: String) {
        doubleViewCancelButton.setTitle(cancelTitle, for: .normal)
        doubleViewAcceptButton.setTitle(acceptTitle, for: .normal)
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
