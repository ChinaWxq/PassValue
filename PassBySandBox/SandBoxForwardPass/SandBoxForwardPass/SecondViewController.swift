//
//  SecondViewController.swift
//  SandBoxForwardPass
//
//  Created by Ryan on 2020/2/5.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

import UIKit

class SecondViewController: UIViewController {

    func setupView() {
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(button)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //从沙盒文件中，读取UserDefaults单例，并获取value
        let userDefaults = UserDefaults.standard
        guard let text = userDefaults.value(forKey: "TextData") else {
            return
        }
        label.text = (text as! String)
    }
    
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth / 2 - 50, y: ScreenHeight / 2 - 25, width: 100, height: 50))
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 100, y: ScreenHeight / 2 + 100, width: 200, height: 50))
        button.setTitle("点击回到第一个界面", for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapToDismiss), for: .touchUpInside)
        return button
    }()
    
    @objc func tapToDismiss() {
        dismiss(animated: true, completion: nil)
    }


}
