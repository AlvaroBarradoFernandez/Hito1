//
//  ViewController.swift
//  Hito1
//
//  Created by Alvaro Barrado on 4/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

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
    
    @IBAction func accionbuttonregistro(){
        if !((txtfUser?.text?.isEmpty)!) && !((txtfPass?.text?.isEmpty)!) && !((txtfPasscon?.text?.isEmpty)!) && !((txtfemail?.text?.isEmpty)!) && txtfPasscon?.text == txtfPass?.text{
            self.performSegue(withIdentifier: "Aceptar", sender: self)
        }
        
       
        
    }
}

