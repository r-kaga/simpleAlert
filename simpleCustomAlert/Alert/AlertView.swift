//
//  AlertView.swift
//  simpleCustomAlert
//
//  Created by 加賀谷諒 on 2017/08/17.
//  Copyright © 2017年 ryo kagaya. All rights reserved.
//

import Foundation
import UIKit

class AlertView: Alert {
    
    var titleText: String
    var messageText: String
    var accept: String
    var cancel: String
    

    init(title: String, message: String, accept: String = "OK", cancel: String = "Cancel") {
        self.titleText = title
        self.messageText = message
        self.accept = accept
        self.cancel = cancel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let content: UIView = {
        let contentView = UIView()
        contentView.frame = CGRect(x: 0,
                                   y: 0,
                                   width: AppSize.screenWidth / 1.2,
                                   height: AppSize.screenHeight / 2)
        
        contentView.center = CGPoint(x: AppSize.screenWidth / 2,
                                     y: AppSize.screenHeight / 2)
        
        contentView.backgroundColor = UIColor.hexStr(hexStr: "#72acff", alpha: 1)
        return contentView
    }()
    
    private let titleView: UILabel = {
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 0,
                                  y: 0,
                                  width: AppSize.screenWidth,
                                  height: AppSize.screenHeight / 2)
        
        titleLabel.center = CGPoint(x: Alert.contentViewRect.width / 2,
                                    y: Alert.contentViewRect.height / 3.0)
        
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private let messageView: UILabel = {
        let messageLabel = UILabel()
        messageLabel.frame = CGRect(x: 0,
                                    y: 0,
                                    width: AppSize.screenWidth,
                                    height: AppSize.screenHeight / 2)
        
        messageLabel.center = CGPoint(x: Alert.contentViewRect.width / 2,
                                      y: Alert.contentViewRect.height / 1.8)
        
        messageLabel.textColor = .white
        messageLabel.textAlignment = .center
        return messageLabel
    }()

    private let singleButton: UIButton = {
        let singleViewAcceptButton = UIButton()
        singleViewAcceptButton.frame = CGRect(x: 0,
                                              y: 0,
                                              width: Alert.contentViewRect.width / 1.2 ,
                                              height: 50)
        
        singleViewAcceptButton.center = CGPoint(x: Alert.contentViewRect.width / 2,
                                                y: Alert.contentViewRect.height - singleViewAcceptButton.frame.height / 1.5)
        
//        singleViewAcceptButton.backgroundColor = UIColor.hexStr(hexStr: "#72acff", alpha: 1)
        singleViewAcceptButton.backgroundColor = UIColor.white
        
        singleViewAcceptButton.setTitleColor(.black, for: .normal)
        singleViewAcceptButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        singleViewAcceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        
        singleViewAcceptButton.layer.masksToBounds = true
        singleViewAcceptButton.layer.cornerRadius = 20.0
        return singleViewAcceptButton
    }()
    
    
    private let doubleButtonVIew: UIView = {
        let doubleButtonView = UIView()
        doubleButtonView.frame = CGRect(x: 0,
                                        y: 0,
                                        width: Alert.contentViewRect.width,
                                        height: 50)
        
        doubleButtonView.center = CGPoint(x: Alert.contentViewRect.width / 2,
                                          y: Alert.contentViewRect.height - 30)
        return doubleButtonView
    }()
    
    
    private let doubleAcceptButton: UIButton = {
       
        let doubleViewAcceptButton = UIButton()
        doubleViewAcceptButton.frame = CGRect(x: 0,
                                              y: 0,
                                              width: Alert.contentViewRect.width / 2 - 15,
                                              height: 50)
        
        doubleViewAcceptButton.center = CGPoint(x: Alert.contentViewRect.width / 2 + (Alert.contentViewRect.width / 4) - 2,
                                                y: Alert.contentViewRect.origin.y - doubleViewAcceptButton.bounds.height / 1.5)
        doubleViewAcceptButton.backgroundColor = .white
        doubleViewAcceptButton.setTitleColor(.black, for: .normal)
        doubleViewAcceptButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        
        doubleViewAcceptButton.layer.masksToBounds = true
        doubleViewAcceptButton.layer.cornerRadius = 5.0
        doubleViewAcceptButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)

        return doubleViewAcceptButton
    }()
    
    private let doubleCancelButton: UIButton = {
        
        let doubleViewCancelButton = UIButton()
        doubleViewCancelButton.frame = CGRect(x: 0,
                                              y: 0,
                                              width: Alert.contentViewRect.width / 2 - 15,
                                              height: 50)
        
        doubleViewCancelButton.center = CGPoint(x:  Alert.contentViewRect.width / 2 - (Alert.contentViewRect.width / 4) + 2,
                                                y: Alert.contentViewRect.origin.y - doubleViewCancelButton.bounds.height / 1.5)
        
        doubleViewCancelButton.backgroundColor = .black
        doubleViewCancelButton.setTitleColor(.white, for: .normal)
        
        doubleViewCancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        
        doubleViewCancelButton.layer.masksToBounds = true
        doubleViewCancelButton.layer.cornerRadius = 5.0
        
        
        doubleViewCancelButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        
        return doubleViewCancelButton

    }()
    
    
    private let circleImageView: UIView = {
        let circleView = UIView(frame: CGRect(x: 0, y: 0, width: 130, height: 130))
        circleView.backgroundColor = UIColor.hexStr(hexStr: "#72acff", alpha: 1)
        circleView.center = CGPoint(x: Alert.contentViewRect.width / 2,
                                     y: Alert.contentViewRect.minY - Alert.contentViewRect.height)
        circleView.layer.masksToBounds = true
        circleView.layer.cornerRadius = circleView.bounds.width / 2
       
        return circleView
    }()
    
    private let alertImageView: UIImageView = {
        
        let alertImage = UIImageView()
        alertImage.frame = CGRect(x: 0,
                                  y: 0,
                                  width: 80,
                                  height: 80)
        
        alertImage.center = CGPoint(x: Alert.contentViewRect.width / 2,
                                    y: Alert.contentViewRect.minY - Alert.contentViewRect.height)
        return alertImage
    }()
    
    // SingleAlert ContentView
    func setUpSingleAlert() -> UIView {
       let content: UIView = {
        
            let contentView = self.content
        
            let titleLabel = self.titleView
            titleLabel.text = self.titleText
            contentView.addSubview(titleLabel)
        
            let messageLabel = self.messageView
            messageLabel.text = self.messageText
            contentView.addSubview(messageLabel)
        
            let singleViewAcceptButton = self.singleButton
            singleViewAcceptButton.setTitle(self.accept, for: .normal)
            contentView.addSubview(singleViewAcceptButton)
        
            let circle = self.circleImageView
            
            let alertImage = self.alertImageView
            alertImage.image = self.getAlertImage()
            
            contentView.addSubview(circle)
            contentView.addSubview(alertImage)
        
            return contentView
        }()
        return content
    }
    
    
    // DoubleAlert ContentView
    func setUpDoubleAlert() -> UIView {
        
        let content: UIView = {
            
            let contentView = self.content
            
            let acceptButton = self.doubleAcceptButton
            let cancelButton = self.doubleCancelButton

            acceptButton.setTitle(self.accept, for: .normal)
            cancelButton.setTitle(self.cancel, for: .normal)
            
            contentView.addSubview(acceptButton)
            contentView.addSubview(cancelButton)

            let titleLabel = self.titleView
            titleLabel.text = self.titleText
            contentView.addSubview(titleLabel)
            
            let messageLabel = self.messageView
            messageLabel.text = self.messageText
            contentView.addSubview(messageLabel)
            
            let circle = self.circleImageView
            
            let alertImage = self.alertImageView
            alertImage.image = self.getAlertImage()
            
//            circle.addSubview(alertImage)
            contentView.addSubview(circle)
            contentView.addSubview(alertImage)
            
            return contentView
        }()
        return content
    }
    


}




private extension AlertView {

    
    func getAlertImage() -> UIImage {
        return UIImage(named: "insert_comment.png")!
    }


}











