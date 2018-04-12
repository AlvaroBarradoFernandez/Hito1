//
//  Perfil.swift
//  Hito1
//
//  Created by Alvaro Barrado on 12/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit


class Perfil: NSObject {
    var sNombre:String?
    var iFecha:Int?
    var sApellidos:String?
    func setMap(valores:[String:Any]) {
        sNombre = valores["nombre"] as! String
        sApellidos = valores["apellido"] as! String
        iFecha = valores["nacimiento"] as! Int
        print(sNombre+" "+sApellidos+" "+iFecha)
    }
    func getMap() -> [String:Any]{
        return [
            "nombre": sNombre as? Any,
            "apellido": sApellidos as? Any,
            "nacimiento": iFecha as? Any
        ]
    }
}
