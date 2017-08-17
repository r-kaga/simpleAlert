import UIKit

enum SingleAlertControllerType {
	case SingleButton(String)
}

class SingleAlert: CustomAlert {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var singleViewAcceptButton: UIButton!

    var buttonType = SingleAlertControllerType.SingleButton("")

    var titleText: String = ""
    var messageText: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        singleViewAcceptButton.addTarget(self, action: #selector(super.acceptButtonTapped), for: .touchUpInside)
        
        titleLabel.text = titleText
        messageLabel.text = messageText
        
        switch buttonType {
        case let .SingleButton(title) :
            addSingleButton(title: title)
            
        }
        
        addSingleButton(title: title ?? "OK")

        super.animationContentView(hidden: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        super.animationContentView(hidden: false)
    }

    
    private func addSingleButton(title: String) {
        singleViewAcceptButton.setTitle(title, for: .normal)
    }
    
    
}



/**
 *  Show ---------------------
 */
extension SingleAlert {
    
    /*
     SingleAlert.show(self, title: "タイトル", message: "メッセージを\n表示しています") { action in
        print(action)
     }
     */
    class func show(_ vc: UIViewController, title: String, message: String, buttonTitle: String = "OK", handler: AlertAction?) {
        guard let alert = UIStoryboard(name: "SingleAlert", bundle: nil).instantiateInitialViewController()
            as? SingleAlert else { return }
        alert.titleText = title
        alert.messageText = message
        alert.buttonType = .SingleButton(buttonTitle)
        alert.handler = handler
        
        vc.present(alert, animated: false, completion: nil)
    }
    
}
