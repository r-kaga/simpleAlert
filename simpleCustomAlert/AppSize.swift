//
//  AppSize.swift
//  MyLibrary
//
//  Created by 加賀谷諒 on 2017/08/04.
//  Copyright © 2017年 ryo kagaya. All rights reserved.
//

import UIKit

struct AppSize {
    
    static var screenWidth: CGFloat { return UIScreen.main.bounds.width }
    static var screenHeight: CGFloat { return UIScreen.main.bounds.height }
    static var navigationBarHeight: CGFloat { return 44 }
    static var toolBarHeight: CGFloat { return 44 }
    static var statusBarHeight: CGFloat { return UIApplication.shared.statusBarFrame.height }
    static var statusBarAndNavigationBarHeight: CGFloat { return statusBarHeight + navigationBarHeight }
    
    static let contentViewRect: CGRect = CGRect(x: AppSize.screenWidth / 2, y: AppSize.screenHeight / 2,
                                                width: AppSize.screenWidth / 1.2, height: AppSize.screenHeight / 2)
    
    static var window: CGRect {
        let app = UIApplication.shared.delegate as! AppDelegate
        return (app.window?.frame)!
    }
    
}
