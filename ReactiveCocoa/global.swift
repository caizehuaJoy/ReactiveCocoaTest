//
//  global.swift
//  ReactiveCocoa
//
//  Created by 蔡泽华 on 2017/7/21.
//  Copyright © 2017年 蔡泽华. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

let a = "aaaa"


func RGBA(_ rgbValue:Int,alpha:Float) -> UIColor {
    return UIColor(colorLiteralRed:  Float((rgbValue & 0xFF0000) >> 16)/255.0, green: Float((rgbValue & 0xFF00) >> 8)/255.0, blue: Float(rgbValue & 0xFF)/255.0, alpha: alpha)
}
func RGB(_ rgbValue:Int) -> UIColor {
   return RGBA(rgbValue, alpha: 1.0)
}
func kiPhone6FixFont(_ value:CGFloat)->CGFloat
{
  
    return  (UIScreen.main.bounds.size.width-375)/15/UIScreen.main.scale +  value
    
}
func kiPhone6STrueWidth(_ value:Float)->Float
{
    
    return  Float(UIScreen.main.bounds.size.width/375.0)*value;
    
}

