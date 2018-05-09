//
//  VCRegistro.swift
//  Hito1
//
//  Created by Alvaro Barrado on 9/5/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCRegistro: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var txtfPass:UITextField?
    @IBOutlet var txtfPasscon:UITextField?
    @IBOutlet var txtfEmail:UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickRegistrar(){
        DataHolder.sharedInstance.miPerfil.iPass = txtfPass?.text
        DataHolder.sharedInstance.miPerfil.semail = txtfEmail?.text
        
        Auth.auth().createUser(withEmail: (txtfEmail?.text)!, password: (txtfPass?.text)!){(user, error) in
            if user != nil{
                DataHolder.sharedInstance.firUser = user
                 self.performSegue(withIdentifier: "registrar", sender: self)
               
            }
        }
    }


}
