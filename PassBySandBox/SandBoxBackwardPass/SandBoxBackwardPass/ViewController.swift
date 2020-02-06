//
//  ViewController.swift
//  SandBoxBackwardPass
//
//  Created by Ryan on 2020/2/5.
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userDefaulst = UserDefaults.standard
        guard let text = userDefaulst.value(forKey: "TextData") else {
            return
        }
        label.text = (text as! String)
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





