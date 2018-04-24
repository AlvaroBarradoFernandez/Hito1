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

class DataHolder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    var firestoreDB:Firestore?
    var miPerfil:Perfil = Perfil()
    func initFireBase(){
        firestoreDB = Firestore.firestore()
        FirebaseApp.configure()
        firestoreDB = Firestore.firestore()
        firStorage = Storage.storage()
    }
}
