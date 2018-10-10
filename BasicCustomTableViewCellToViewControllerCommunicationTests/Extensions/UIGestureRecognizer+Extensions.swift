//
//  UIGestureRecognizer+Extensions.swift
//  BasicCustomTableViewCellToViewControllerCommunicationTests
//
//  Created by Milos Dimic on 10/10/18.
//  Copyright © 2018 Milos Dimic. All rights reserved.
//

import UIKit
@testable import BasicCustomTableViewCellToViewControllerCommunication

// MARK: Important: This extension must stay in test target only or it may cause your app to be rejected by Apple

public typealias TargetActionInfo = [(target: AnyObject, action: Selector)]

extension UIGestureRecognizer {
    
    public func getTargetInfo() -> TargetActionInfo {
        var targetsInfo: TargetActionInfo = []
        
        if let targets = self.value(forKeyPath: "_targets") as? [NSObject] {
            for target in targets {
                
                let selectorString = String.init(describing: target).components(separatedBy: ", ").first!.replacingOccurrences(of: "(action=", with: "")
                let selector = NSSelectorFromString(selectorString)
                
                let targetActionPairClass: AnyClass = NSClassFromString("UIGestureRecognizerTarget")!
                let targetIvar: Ivar = class_getInstanceVariable(targetActionPairClass, "_target")!
                let targetObject: AnyObject = object_getIvar(target, targetIvar) as AnyObject
                
                targetsInfo.append((target: targetObject, action: selector))
            }
        }
        
        return targetsInfo
    }
    
    public func execute() {
        let targetsInfo = self.getTargetInfo()
        for info in targetsInfo {
            info.target.performSelector(onMainThread: info.action, with: nil, waitUntilDone: true)
        }
    }
}
