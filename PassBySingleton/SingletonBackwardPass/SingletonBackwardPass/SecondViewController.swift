//
//  SecondViewController.swift
//  SingletonBackwardPass
//
//  Created by Ryan on 2020/2/6.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(button)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    lazy var textField: UITextField = {
        let field = UITextField(frame: CGRect(x: ScreenWidth / 2 - 150, y: ScreenHeight / 2 - 25, width: 300, height: 50))
        field.borderStyle = .line
        return field
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 100, y: ScreenHeight / 2 + 100, width: 200, height: 50))
        button.setTitle("点击向第一个界面传值", for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapToDismiss), for: .touchUpInside)
        return button
    }()
    
    @objc func tapToDismiss() {
        let instance = DefaultInstance.sharedInstance()
        instance.data = textField.text!
//        使用系统单例
//        let appDelegate = UIApplication.shared.delegate as? AppDelegate
//        appDelegate?.str = textField.text
        dismiss(animated: true, completion: nil)
    }
    
}

