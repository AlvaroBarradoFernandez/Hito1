//
//  Perfil.swift
//  Hito1
//
//  Created by Alvaro Barrado on 12/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit


class Perfil: NSObject {
    var sID:String?
    var sFirst:String?
    var iPass:String?
    var semail:String?
    var iAge:Int?
    var iWeight:Double?
    var iHeight:Double?
    var sImg:String?
    
    func setMap(valores:[String:Any]) {
        sFirst = valores["first"] as? String
        iPass = valores["pass"] as? String
        semail = valores["email"] as? String
        iAge = valores["age"] as? Int
        iHeight = valores["height"] as? Double
        iWeight = valores["weight"] as? Double
        sImg = valores["url_image"] as? String
    }
    func getMap() -> [String:Any]{
        var mapTemp:[String:Any] = [:]
        mapTemp["first"] = sFirst
        mapTemp["pass"] = iPass
        mapTemp["email"] = semail
        mapTemp["age"] = iAge
        mapTemp["height"] = iHeight
        mapTemp["weight"] = iWeight
        mapTemp["url_image"] = sImg
        return mapTemp
          
        
    }
}
