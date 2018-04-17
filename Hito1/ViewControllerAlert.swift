//
//  ViewControllerAlert.swift
//  Hito1
//
//  Created by Alvaro Barrado on 17/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

class ViewControllerAlert: UIViewController {

        //IBOutlets - Propiedades
        @IBOutlet weak var mensajeLabel: UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            mensajeLabel.text = ""
        }
        
        func mostrarAlerta(title: String, message: String) {
            let alertaGuia = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let guiaOk = UIAlertAction(title: "Registro", style: .default) { (action) in
                self.mensajeLabel.text = "Te regristraste"
            }
            let cancelar = UIAlertAction(title: "Volver", style: .default, handler: {(action) in
                self.mensajeLabel.text = ""
            })
            alertaGuia.addAction(guiaOk)
            alertaGuia.addAction(cancelar)
            present(alertaGuia, animated: true, completion: nil)
        }
        @IBAction func btnMostrarGuiaPressed(_ sender: UIButton) {
            mostrarAlerta(title: "Regsitro", message: "HOLA")
        }
        
    }

