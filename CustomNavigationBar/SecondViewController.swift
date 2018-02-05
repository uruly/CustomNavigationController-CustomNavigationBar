//
//  SecondViewController.swift
//  CustomNavigationBar
//
//  Created by Reo on 2018/02/05.
//  Copyright © 2018年 Reo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.yellow
        
        let backBtn = UIBarButtonItem(title: "戻る", style: .plain, target: self, action: #selector(self.backBtnTapped))
        self.navigationItem.leftBarButtonItem = backBtn
        
    }
    
    @objc func backBtnTapped(){
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
