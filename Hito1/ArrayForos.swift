//
//  ArrayForos.swift
//  Hito1
//
//  Created by Alvaro Barrado on 25/5/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

class ArrayForos: NSObject {
    var sForo:String?
    var sID:String?
    //var arMensaje:[Mensaje] = []
    
    func setMap(valores:[String:Any]){
        sForo = valores["Foros"] as? String
        /*
        var ruta:String = String(format: "Foros/%@/Mensajes", sID)
        DataHolder.sharedInstance.firestoreDB?.collection(ruta).addSnapshotListener() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.arForos = []
                for document in querySnapshot!.documents {
                    let Foros:ArrayForos = ArrayForos()
                    Foros.sID=document.documentID
                    Foros.setMap(valores:document.data())
                    self.arForos.append(Foros)
                    print("\(document.documentID) => \(document.data())")
                }
                print("------>>>>", self.arForos.count)
            }
        }*/
        
    }
    func getMap() -> [String:Any]{
        var mapTemp:[String:Any] = [:]
        mapTemp["Foros"] = sForo
        return getMap()
}
}
