//
//  Relme.swift
//  shoumikigen
//
//  Created by 柳澤宙輝 on 2017/06/11.
//  Copyright © 2017年 柳澤宙輝. All rights reserved.
//
import RealmSwift

class Relme: Object {
    
    dynamic var id: Int = 0
    dynamic var name:String = ""
    dynamic var image:NSData = NSData()
    dynamic var date:Date = Date()
    
}
