//
//  SimpleFlatAlert.swift
//  simpleCustomAlert
//
//  Created by 加賀谷諒 on 2017/08/24.
//  Copyright © 2017年 ryo kagaya. All rights reserved.
//

import Foundation
import UIKit

struct SimpleFlatAlert {

    var title: String
    var message: String
    var accept: String
    var cancel: String
    
    init(title: String, message: String, accept: String = "OK", cancel: String = "Cancel") {
        self.title = title
        self.message = message
        self.accept = accept
        self.cancel = cancel
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
        view.center = CGPoint(x: AppSize.contentViewRect.width / 2, y: AppSize.contentViewRect.minY - AppSize.contentViewRect.height / 1.3)
        
        return view
    }()
    
    func setUpSingleAlert() -> UIView {
        let contentView: UIView = {
            let content = self.content
            
            let alertImageView = self.alertImageView
            alertImageView.image = self.getAlertImage()
            content.addSubview(alertImageView)
            
            return content
        }()
        return contentView
    }
    
    
    func getAlertImage() -> UIImage {
        return UIImage(named: "insert_comment.png")!
    }
    
}






