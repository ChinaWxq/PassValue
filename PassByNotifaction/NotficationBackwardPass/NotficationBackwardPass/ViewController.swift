//
//  ViewController.swift
//  NotficationBackwardPass
//
//  Created by Ryan on 2020/2/6.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit
let Frame = UIScreen.main.bounds
let ScreenWidth = Frame.width
let ScreenHeight = Frame.height

class ViewController: UIViewController {
    
    func setupView() {
        view.addSubview(label)
        view.addSubview(button)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        //注册通知
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotfication(_:)), name: NSNotification.Name(rawValue: "新数据"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    //实现处理方法，数据在userInfo中
    @objc func handleNotfication(_ notifcation: Notification) {
        self.label.text = notifcation.userInfo!["text"] as? String
    }
    
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth / 2 - 50, y: ScreenHeight / 2 - 25, width: 100, height: 50))
        label.text = ""
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 100, y: ScreenHeight / 2 + 100, width: 200, height: 50))
        button.setTitle("点击跳转第二个界面", for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapToPresent), for: .touchUpInside)
        return button
    }()
    
    @objc func tapToPresent() {
        let toVC = SecondViewController()
        toVC.modalPresentationStyle = .fullScreen
        present(toVC, animated: true, completion: nil)
    }
}
