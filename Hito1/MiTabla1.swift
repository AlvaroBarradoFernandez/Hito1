//
//  MiTabla1.swift
//  Hito1
//
//  Created by Alvaro Barrado on 5/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

class MiTabla1: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tablamia:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        tablamia?.delegate=self
        tablamia?.dataSource=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celdamia = tableView.dequeueReusableCell(withIdentifier: "celdamia") as! micelda1
        
        if indexPath.row==0{
            celdamia.miLabel?.text = "Manzana"
            celdamia.miImagen?.image = #imageLiteral(resourceName: "manzana")
        }
        else if indexPath.row == 1{
            celdamia.miLabel?.text = "Pera"
            celdamia.miImagen?.image = #imageLiteral(resourceName: "pera")
        }
        else if indexPath.row == 2{
            celdamia.miLabel?.text = "Piña"
            celdamia.miImagen?.image = #imageLiteral(resourceName: "pina")
        }
        else if indexPath.row == 3{
            celdamia.miLabel?.text = "Platano"
            celdamia.miImagen?.image = #imageLiteral(resourceName: "platano")
        }
        else if indexPath.row == 4{
            celdamia.miLabel?.text = "Cereza"
            celdamia.miImagen?.image = #imageLiteral(resourceName: "cereza")
        }
        return celdamia
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
