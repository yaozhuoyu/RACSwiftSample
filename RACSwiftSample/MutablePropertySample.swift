//
//  MutablePropertySample.swift
//  RACSwiftSample
//
//  Created by 姚卓禹 on 16/4/25.
//  Copyright © 2016年 yzy. All rights reserved.
//

import Foundation

import ReactiveCocoa


func MutablePropertySample(){
    let valueMP = MutableProperty(1)
    
    valueMP.producer.startWithNext { (next) in
        print("mutableProperty next \(next)")
    }
    
    valueMP.value = 2
    
    //会打印出 1， 2  当开始start的时候，会读取一个当前property的值，然后当有下一个值的时候继续打印。
    
    
    
}