//
//  ViewController.swift
//  Hito1
//
//  Created by Alvaro Barrado on 4/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {
    @IBOutlet var txtfUsuario:UITextField?
    @IBOutlet var txtfContraseña:UITextField?
    @IBOutlet var txtfUser:UITextField?
    @IBOutlet var txtfPass:UITextField?
    @IBOutlet var txtfPasscon:UITextField?
    @IBOutlet var txtfemail:UITextField?
    @IBOutlet var buttonLogear:UIButton?
    @IBOutlet var buttonaceptar:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        txtfUser?.text = DataHolder.sharedInstance.sNick
       /*
        txtfUser?.text = DataHolder.sharedInstance.sNick
        DataHolder.sharedInstance.sNick = "Nacho"
        txtfPass?.text = DataHolder.sharedInstance.sNick
 */
 /*
        do {
          try Auth.auth().signOut()
        }catch{
            
        }
        */
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil{
               // self.performSegue(withIdentifier: "entrar", sender: self)
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func accionbuttonLogear(){
        /*
        if txtfUsuario?.text=="Alvaro" &&  txtfContraseña?.text=="1234" {
            self.performSegue(withIdentifier: "entrar", sender: self)
        }
        if txtfUsuario?.text=="Kiran" &&  txtfContraseña?.text=="1234" {
            self.performSegue(withIdentifier: "entrar", sender: self)
        }
    */
 // Lo comento porque da error ARREGLAR PARA QUE PUEDAS INICIAR SESIÓN CON UN USUARIO NUEVO QUE SE HA REGISTRADO
        
        print(txtfUsuario?.text)
        print(txtfContraseña?.text)
        Auth.auth().signIn(withEmail: (txtfUsuario?.text)!, password: (txtfContraseña?.text)!) { (user, error) in
            if (user != nil){
                let refPerfil =
                DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").document ((user?.uid)!)
                refPerfil?.getDocument{(document, error) in if document != nil{
                    DataHolder.sharedInstance.miPerfil.setMap(valores:(document?.data())!)
                    print(DataHolder.sharedInstance.miPerfil.sFirst!)
                    self.performSegue(withIdentifier: "entrar", sender: self)
                
                
                //self.performSegue(withIdentifier: "entrar", sender: self)
            }
            else{
                print(error!)
            }
            
        }
    }
        }
    }
    @IBAction func clickRegistrar(){
        Auth.auth().createUser(withEmail: (txtfemail?.text)!, password: (txtfPass?.text)!) {(user, error) in
        if (user != nil){
            print("Te registraste")
            // Add a new document with a generated ID
                DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").document((user?.uid)!).setData([
                "first": self.txtfUser?.text,
                "pass": self.txtfPass?.text,
                "email": self.txtfemail?.text
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: ")
                }
            }
        }
        else{
            print("No se ha creado")
            print(error!)
        }
        }
    }
    
    
    @IBAction func accionbuttonregistro(){
        DataHolder.sharedInstance.miPerfil.sFirst = "Yony"
        DataHolder.sharedInstance.miPerfil.iPass = "123456"
        DataHolder.sharedInstance.miPerfil.semail = "asd@gmail.com"
//        if !((txtfUser?.text?.isEmpty)!) && !((txtfPass?.text?.isEmpty)!) && !((txtfPasscon?.text?.isEmpty)!) && !((txtfemail?.text?.isEmpty)!) && txtfPasscon?.text == txtfPass?.text{
//            self.performSegue(withIdentifier: "Aceptar", sender: self)
//        }
        
        Auth.auth().signIn(withEmail: (txtfUser?.text)!, password: (txtfPass?.text)!){(user, error) in
            if user != nil{
                let refPerfil = DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").document((user?.uid)!)
                refPerfil?.getDocument { (document, error) in
                    if document != nil {
                        DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                        self.performSegue(withIdentifier: "entrar", sender: self)
                    }
                
                }
            }
        }
    }
}


