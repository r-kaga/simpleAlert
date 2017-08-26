//
//  SimpleFlatAlert.swift
//  simpleCustomAlert
//
//  Created by 加賀谷諒 on 2017/08/24.
//  Copyright © 2017年 ryo kagaya. All rights reserved.
//

import Foundation
import UIKit

//struct SimpleFlatAlert {
class SimpleFlatAlert: Alert {
    
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
    
    let content: UIView = {
        let contentView = UIView()
        contentView.frame = CGRect(x: 0,
                                   y: 0,
                                   width: AppSize.screenWidth / 1.2,
                                   height: AppSize.screenHeight / 2)
        
        contentView.center = CGPoint(x: AppSize.screenWidth / 2,
                                     y: AppSize.screenHeight / 2)
        
        contentView.backgroundColor = .white
        return contentView
    }()

    
    var alertImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: 80,
                                             height: 80
                                ))
        view.center = CGPoint(x: AppSize.contentViewRect.width / 2, y: AppSize.contentViewRect.height - AppSize.contentViewRect.height / 1.25)
        
        return view
    }()
    
    let titleView: UILabel = {
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 0,
                                  y: 0,
                                  width: AppSize.screenWidth,
                                  height: AppSize.screenHeight / 3)
        
        titleLabel.center = CGPoint(x: AlertView.contentViewRect.width / 2,
                                   y: AppSize.contentViewRect.height - AppSize.contentViewRect.height / 1.6)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    let messageView: UILabel = {
       let view = UILabel()
       view.frame = CGRect(x: 0,
                            y: 0,
                            width: AppSize.screenWidth,
                            height: AppSize.screenHeight / 3)
        
       view.center = CGPoint(x: AppSize.contentViewRect.width / 2, y:AppSize.contentViewRect.height - AppSize.contentViewRect.height / 2.5)
       view.textAlignment = .center
       view.textColor = UIColor.hexStr(hexStr: "#d3d3d3", alpha: 0.8)
       view.font = UIFont.systemFont(ofSize: 15)
       return view
    }()
    
    let button: UIButton = {
       let view = UIButton()
        view.frame = CGRect(x: 0,
                            y: 0,
                            width: AppSize.contentViewRect.width,
                            height: 50)
        view.center = CGPoint(x: AppSize.contentViewRect.width / 2, y:AppSize.contentViewRect.height - view.frame.height / 2)
        view.backgroundColor = UIColor.hexStr(hexStr: "#f9c600", alpha: 1)
        
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        view.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
    
        return view
    }()
    
    func setUpSingleAlert() -> UIView {
        let contentView: UIView = {
            let content = self.content
            
            let alertImageView = self.alertImageView
            alertImageView.image = self.getAlertImage()
            content.addSubview(alertImageView)
            
            let title = self.titleView
            title.text = self.titleText
            content.addSubview(title)
            
            let message = self.messageView
            message.text = self.messageText
            content.addSubview(message)
            
            let button = self.button
            button.setTitle(self.accept, for: .normal)
            content.addSubview(button)
            
            return content
        }()
        return contentView
    }
    
    
    func getAlertImage() -> UIImage {
        return UIImage(named: "insert_comment.png")!
    }
    
}






