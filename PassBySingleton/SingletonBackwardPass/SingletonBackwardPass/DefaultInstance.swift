//
//  DefaultInstance.swift
//  SingletonBackwardPass
//
//  Created by Ryan on 2020/2/6.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

//自定义单例类
class DefaultInstance: NSObject {
    //公共属性
    open var data = String()
    
    //私有静态属性
    private static let instance = DefaultInstance()
    
    //类方法返回单例
    class func sharedInstance() -> DefaultInstance {
        return instance
    }
}
