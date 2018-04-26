//
//  DataHolder.swift
//  Hito1
//
//  Created by Alvaro Barrado on 10/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
var arPerfiles:[Perfil] = []
class DataHolder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    var firestoreDB:Firestore?
    var miPerfil:Perfil = Perfil()
    var arPerfiles:[Perfil] = []
    var firStorage:Storage?
    func initFireBase(){
        FirebaseApp.configure()
        firestoreDB = Firestore.firestore()
        firStorage = Storage.storage()
    }
    func descargarPerfiles(delegate:DataHolderDelegate){
        firestoreDB?.collection("Perfiles").getDocuments() { (querySnapshot, err) in
            if let err = err{
                print("Error getting documents: \(err)")
                delegate.DHDDescargaCiudadesCompleta!(blFin: false)
            } else {
                for document in querySnapshot!.documents {
                    let Perfiles:Perfil = Perfil()
                    Perfiles.sID=document.documentID
                    Perfiles.setMap(valores:document.data())
                    self.arPerfiles.append(Perfiles)
                    print("\(document.documentID) => \(document.data())")
                }
                print("------>>>>", self.arPerfiles.count)
                delegate.DHDDescargaCiudadesCompleta!(blFin: true)
            }
        }
    }
}

@objc protocol DataHolderDelegate{
    @objc optional func DHDDescargaCiudadesCompleta(blFin:Bool)
}


