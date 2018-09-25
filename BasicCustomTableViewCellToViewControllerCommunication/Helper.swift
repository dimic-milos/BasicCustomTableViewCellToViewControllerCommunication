//
//  Helper.swift
//  BasicCustomTableViewCellToViewControllerCommunication
//
//  Created by Milos Dimic on 9/25/18.
//  Copyright © 2018 Milos Dimic. All rights reserved.
//

import UIKit

func superviewForElement<T:UIView>(_ element:UIView) -> T?{
    var view:UIView?
    var cell:T?
    view = element.superview
    while !(view is T) && view != nil{
        view = view?.superview
    }
    
    if(view != nil){
        if let c = view as? T {
            cell = c
        }
    }
    
    return cell
}
