//
//  ViewController.swift
//  BlockBackwardPass
//
//  Created by Ryan on 2020/2/6.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

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
        // Do any additional setup after loading the view.
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
    
    //自定义闭包实现反向传值，是很流行推荐的方法
    @objc func tapToPresent() {
        let toVC = SecondViewController()
        toVC.modalPresentationStyle = .fullScreen
        //实现闭包
        toVC.backwardValueClosure = { (text) in
            self.label.text = text
        }
        present(toVC, animated: true, completion: nil)
    }
    
    //系统闭包传值，会有延迟
//    @objc func tapToPresent() {
//        let secondVC = SecondViewController()
//        secondVC.modalPresentationStyle = .fullScreen
//        secondVC.toVC = self
//        present(secondVC, animated: true, completion: nil)
//    }
}








