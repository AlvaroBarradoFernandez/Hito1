//
//  VCLogin.swift
//  Hito1
//
//  Created by Alvaro Barrado on 9/5/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCLogin:  UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var txtfUsuario:UITextField?
    @IBOutlet var txtfContraseña:UITextField?
    @IBOutlet var buttonLogear:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.blConfg = false
        // Do any additional setup after loading the view.
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
        print(txtfUsuario?.text)
        print(txtfContraseña?.text)
        Auth.auth().signIn(withEmail: (txtfUsuario?.text)!, password: (txtfContraseña?.text)!) { (user, error) in
            if (user != nil){
                DataHolder.sharedInstance.firUser = user
                let refPerfil =
                    DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").document ((user?.uid)!)
                refPerfil?.getDocument{(document, error) in if document != nil{
                    DataHolder.sharedInstance.miPerfil.setMap(valores:(document?.data())!)
                    print(DataHolder.sharedInstance.miPerfil.sFirst!)
                    self.performSegue(withIdentifier: "entrar", sender: self)
                    //self.performSegue(withIdentifier: "entrar", sender: self)
                }else{
                    print(error!)
                    }
                }
            }
        }
    }
}
