//
//  ViewController.swift
//  PropertyForwardPass
//
//  Created by Ryan on 2020/2/5.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit
let Frame = UIScreen.main.bounds
let ScreenWidth = Frame.width
let ScreenHeight = Frame.height

class ViewController: UIViewController {

    func setupView() {
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
        button.setTitle("点击向第二个页面传值", for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapToPresent), for: .touchUpInside)
        return button
    }()
    
    @objc func tapToPresent() {
        let toVC = SecondViewController()
        toVC.modalPresentationStyle = .fullScreen
        toVC.text = textField.text
        present(toVC, animated: true, completion: nil)
    }
    
}



