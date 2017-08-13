//
//  ViewController.swift
//  simpleCustomAlert
//
//  Created by 加賀谷諒 on 2017/08/11.
//  Copyright © 2017年 ryo kagaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    @IBAction func showAlert(_ sender: Any) {
        
        
        //        MyAlertController.show(self, title: "タイトル", message: "メッセージを\n表示しています", cancelTitle: "キャンセル", acceptTitle: "おっけー") { action in
        //            switch action {
        //                case .Accept : print("accept!")
        //                case .Cancel : print("cancel!")
        //            }
        //        }
        
        // 画面にbluEffectをかける
//        EffectBlur.showEffectBlur()
        DoubleAlert.show(presentintViewController: self, title: "タイトル", message: "メッセージを\n表示しています") { action in
            switch action {
                case .Accept : print("accept!")
                case .Cancel : print("cancel!")
            }
        }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

