//
//  ViewController.swift
//  CustomNavigationBar
//
//  Created by Reo 2018/02/02.
//  Copyright © 2018年 Reo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        //ここでタイトルを設定
        self.title = "タイトル"
        self.view.backgroundColor = UIColor.white
        
        //キャンセルボタンを作成
        let cancelBtn = UIBarButtonItem(title: "キャンセル", style: .plain, target: self, action: #selector(self.cancelTapped))
        //ボタンを設置
        self.navigationItem.leftBarButtonItem = cancelBtn
        //これはダメ！！！！表示されない！！！
        //self.navigationController?.navigationItem.leftBarButtonItem = cancelBtn
        
        //削除ボタンを作成してツールバーに乗せる
        let trashBtn = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(self.trashTapped))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        self.toolbarItems = [flexible,trashBtn]
        
        //セカンドビューに移動するボタン
        let secondBtn = UIButton()
        secondBtn.frame = CGRect(x:0,y:0,width:80,height:60)
        secondBtn.center = CGPoint(x:width / 2,y:height / 2)
        secondBtn.addTarget(self, action: #selector(secondBtnTapped), for: .touchUpInside)
        secondBtn.setTitle("次へ", for: .normal)
        secondBtn.backgroundColor = UIColor.brown
        self.view.addSubview(secondBtn)
        
    }
    
    @objc func secondBtnTapped() {
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc func cancelTapped() {
        print("キャンセル")
    }
    
    @objc func trashTapped() {
        print("ゴミ箱")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

