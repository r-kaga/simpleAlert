//
//  EffectBlur.swift
//  simway
//
//  Created by ryo kagaya on 2017/07/27.
//  Copyright © 2017年 Staright. All rights reserved.
//

import UIKit

class EffectBlur:
    UIView
{
    
    
    static var effect = UIBlurEffect(style: UIBlurEffectStyle.regular)
    static var effectView : UIVisualEffectView!
    
    /*
     *	UIBlurEffectの表示
     */
    static func showEffectBlur(_ uiView: UIView = (UIApplication.shared.topViewController?.view)!) {
        
        print(uiView)
        if effectView != nil {
            effectView.removeFromSuperview()
        }
        
        print(AppSize.screenWidth)
        print(AppSize.screenHeight)

        // Blurエフェクトを適用するEffectViewを作成.
        effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRect(x:0, y:0, width: AppSize.screenWidth, height: AppSize.screenHeight)
        effectView.center = uiView.center
        effectView.layer.masksToBounds = true
        effectView.layer.cornerRadius = 20.0
        uiView.addSubview(effectView)
        
    }
    
    
    /*
     * UIBlurEffectの非表示
     */
    static func hideEffectBlur() {
        
        effectView.removeFromSuperview()
    }
    
    
    
    
    
}
