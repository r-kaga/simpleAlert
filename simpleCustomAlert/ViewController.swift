
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func SingleAlertFromCode(_ sender: UIButton) {
        Alert.show(self, title: "Good Job!", message: "You Click The Button", cancelTitle: "Cancel", acceptTitle: "OK") { action in
            print("OK")
        }
    }
    
    @IBAction func SingleAlertFromStoryboard(_ sender: UIButton) {
        SingleAlert.show(self, title: "タイトル", message: "メッセージを\n表示しています") { action in
            print(action)
        }
    }
    
    @IBAction func DoubleAlertFromCode(_ sender: UIButton) {
        Alert.show(self, title: "Good Job!", message: "You Click The Button", buttonTitle: "OK") { action in
            print("OK")
        }
    }
    
    @IBAction func DoubleAlertFromStoryboard(_ sender: UIButton) {
        DoubleAlert.show(self, title: "タイトル", message: "メッセージを\n表示しています") { action in
            switch action {
                case .Accept : print("accept!")
                case .Cancel : print("cancel!")
            }
        }
    }

}

