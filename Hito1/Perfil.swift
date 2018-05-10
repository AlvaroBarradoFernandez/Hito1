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
    var fWeight:Float?
    var fHeight:Float?
    var sImg:String?
    var sDate:Date?
    
    func setMap(valores:[String:Any]) {
        sFirst = valores["first"] as? String
        iPass = valores["pass"] as? String
        semail = valores["email"] as? String
        iAge = valores["age"] as? Int
        fHeight = valores["height"] as? Float
        fWeight = valores["weight"] as? Float
        sImg = valores["url_image"] as? String
        sDate = valores["date"] as? Date
        print("****************************", sImg)
    }
    
    func getMap() -> [String:Any]{
        var mapTemp:[String:Any] = [:]
        mapTemp["first"] = sFirst
        mapTemp["pass"] = iPass
        mapTemp["email"] = semail
        mapTemp["age"] = iAge
        mapTemp["height"] = fHeight
        mapTemp["weight"] = fWeight
        mapTemp["url_image"] = sImg
        mapTemp["date"] = sDate
        return mapTemp
    }
}
