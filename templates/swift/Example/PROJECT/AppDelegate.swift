//
//  AppDelegate.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

import UIKit
import YDCommon
import YDPlugin

@main
class AppDelegate: YDApplicationDelegateDispatcher {
    var window: UIWindow? = UIWindow()

    override init() {
        super.init()
        Log.quickSetup()
        YDPluginLoader.shared.load(with: self)
        YDPluginLoader.shared.setupPluginList()
    }
}


/// 入口插件
@objc(DictMainPlugin)
public class DictMainPlugin: YDBasePlugin {
    @InjectedService var debug: YDDebugSettingService
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        debug.isDebug = false
        debug.isTest = debug.isDebug

        guard let windowOptional = application.delegate?.window, let window = windowOptional else {
            return false
        }
        let vc = ViewController()
        let nvc = YDBaseNavigationController(rootViewController: vc)
        window.rootViewController = nvc
        window.makeKeyAndVisible()
        
        return true
    }
}
