//
//  UserDefaultsProtocol.swift
//  mini
//
//  Created by Mac on 2017/5/19.
//  Copyright © 2017年 Mac. All rights reserved.
//

import Foundation

public protocol UserDefaultsSetMode {
    var uniqueKey : String{get}
}

public extension UserDefaultsSetMode where Self:RawRepresentable,Self.RawValue == String{
    
    ///Any类型
    public func store(value: Any?){
        UserDefaults.standard.set(value, forKey: uniqueKey)
    }
    public var value: Any?{
        return UserDefaults.standard.value(forKey: uniqueKey)
    }
    
    public var stringValue: String?{
        return value as? String
    }
    
    ///URL类型
    public func store(url: URL?){
        UserDefaults.standard.set(url, forKey: uniqueKey)
    }
    public var storeUrl: URL?{
        return UserDefaults.standard.url(forKey: uniqueKey)
    }
    
    ///Bool类型
    public func store(value: Bool) {
        UserDefaults.standard.set(value, forKey: uniqueKey)
    }
    public var storedBool: Bool {
        return UserDefaults.standard.bool(forKey: uniqueKey)
    }
    
    // 为所有的key加上枚举名作为命名空间，避免重复
    public var uniqueKey: String{
        return "\(Self.self).\(rawValue)"
    }
    // 删除方法
    public func removed(){
        UserDefaults.standard.removeObject(forKey: uniqueKey)
    }
}
