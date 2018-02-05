//
//  CustomNavigationController.swift
//  CustomNavigationBar
//
//  Created by Reo on 2018/02/02.
//  Copyright © 2018年 Reo. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(rootVC:UIViewController , naviBarClass:AnyClass?, toolbarClass: AnyClass?){
        self.init(navigationBarClass: naviBarClass, toolbarClass: toolbarClass)
        self.viewControllers = [rootVC]
        if toolbarClass != nil {
            self.setToolbarHidden(false, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //なぜかきかなくなる・・・
        self.interactivePopGestureRecognizer?.isEnabled = true
        
        //上記対処をdelegateでする
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //なんでもいいから値をいれておくとアニメーションが直る
        self.navigationBar.frame.size.height = 50
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if #available(iOS 11.0, *) {
            print(self.view.safeAreaInsets)
        }
        //更新
        self.navigationBar.setNeedsLayout()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension CustomNavigationController:UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer is UIScreenEdgePanGestureRecognizer else { return true }
        return viewControllers.count > 1
    }
}
