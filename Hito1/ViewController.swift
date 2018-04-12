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
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func accionbuttonLogear(){
        if txtfUsuario?.text=="Alvaro" &&  txtfContraseña?.text=="1234" {
            self.performSegue(withIdentifier: "entrar", sender: self)
        }
        if txtfUsuario?.text=="Kiran" &&  txtfContraseña?.text=="1234" {
            self.performSegue(withIdentifier: "entrar", sender: self)
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
//        if !((txtfUser?.text?.isEmpty)!) && !((txtfPass?.text?.isEmpty)!) && !((txtfPasscon?.text?.isEmpty)!) && !((txtfemail?.text?.isEmpty)!) && txtfPasscon?.text == txtfPass?.text{
//            self.performSegue(withIdentifier: "Aceptar", sender: self)
//        }
        
        Auth.auth().signIn(withEmail: (txtfUser?.text)!, password: (txtfPass?.text)!){(user, error) in
            if user != nil{
                let refPerfil = DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").document((user?.uid)!)
                refPerfil?.getDocument { (document, error) in
                    if document != nil {
                        print(document?.data())
                    }
                    
                }
            }
        }
    }
}

