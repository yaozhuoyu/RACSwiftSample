//
//  bufferSample.swift
//  RACSwiftSample
//
//  Created by 姚卓禹 on 16/4/25.
//  Copyright © 2016年 yzy. All rights reserved.
//

import Foundation
import ReactiveCocoa


func bufferSample(){
    let (bufferSignalProducer, bufferObserver) = SignalProducer<Int, NSError>.buffer(Int.max)
    
    bufferObserver.sendNext(1)
    bufferObserver.sendNext(2)
    bufferObserver.sendNext(3)
    bufferObserver.sendNext(4)
    bufferObserver.sendNext(5)
    
    
    //先start一个
    bufferSignalProducer.startWithNext { (next) in
        print("startWithNext --- \(next)")  //打印结果： 1，2，3，4，5 会把所有的sendnext打印一遍
    }
    
    bufferSignalProducer.startWithSignal { (signal, disposable) in
        signal.observeNext({ (next) in
            print("startWithSignal --- \(next)")
        })
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC)), dispatch_get_main_queue()) {
        bufferObserver.sendNext(6)
    }
    
    
    
    //当buffer的参数传入为0的时候，是不会缓存的，只会打印出6
    
    
    
    
}
