//
//  SignalProducerSampe.swift
//  RACSwiftSample
//
//  Created by 姚卓禹 on 16/4/25.
//  Copyright © 2016年 yzy. All rights reserved.
//

import Foundation
import ReactiveCocoa
import Result

func  signalProducerStartObserver(){
    //测试signalProducer的start observer方法
    
    let (signalProducer, signalObserver) = SignalProducer<Int, NoError>.buffer(Int.max)
    
    let valueMP = MutableProperty(1)
    
    valueMP.producer.start(signalObserver)
    
    
    signalProducer.startWithNext { (next) in
        print("next --- \(next)")
    }
    
    valueMP.value = 2
    signalObserver.sendNext(3)
}

