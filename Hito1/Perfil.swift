//
//  Perfil.swift
//  Hito1
//
//  Created by Alvaro Barrado on 12/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit


class Perfil: NSObject {
    var sFirst:String?
    var iPass:String?
    var semail:String?
    var iAge:Int?
    func setMap(valores:[String:Any]) {
        sFirst = valores["first"] as? String
        iPass = valores["pass"] as? String
        semail = valores["email"] as? String
        iAge = valores["age"] as? Int
    }
    func getMap() -> [String:Any]{
        var mapTemp:[String:Any] = [:]
        mapTemp["first"] = sFirst
        mapTemp["pass"] = iPass
        mapTemp["email"] = semail
        mapTemp["age"] = iAge
        return mapTemp
          
        
    }
}
