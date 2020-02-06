//
//  SecondViewController.swift
//  PropertyForwardPass
//
//  Created by Ryan on 2020/2/5.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var text: String?

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
    
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth / 2 - 50, y: ScreenHeight / 2 - 25, width: 100, height: 50))
        if self.text != nil {
            print("正向传值：\(self.text!)")
        }
        label.text = text ?? ""
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
