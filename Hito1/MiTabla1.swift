//
//  MiTabla1.swift
//  Hito1
//
//  Created by Alvaro Barrado on 5/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit
import Firebase

class MiTabla1: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tablamia:UITableView?
    var arPerfiles:[Perfil] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").addSnapshotListener() { (querySnapshot, err) in
            if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                self.arPerfiles = []
                    for document in querySnapshot!.documents {
                        let Perfiles:Perfil = Perfil()
                        Perfiles.sID=document.documentID
                        Perfiles.setMap(valores:document.data())
                        self.arPerfiles.append(Perfiles)
                        print("\(document.documentID) => \(document.data())")
                    }
                print("------>>>>", self.arPerfiles.count)
                }
            self.tablamia?.reloadData()
        }
        tablamia?.delegate=self
        tablamia?.dataSource=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arPerfiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celdamia = tableView.dequeueReusableCell(withIdentifier: "celdamia") as! micelda1
        celdamia.miLabel?.text=self.arPerfiles[indexPath.row].sFirst
        celdamia.mostrarImagen(uri: self.arPerfiles[indexPath.row].sImg!)
        //if indexPath.row==0{
         //let query = Perfiles.whereField("*")
        //}
        return celdamia
    }
    func refreshUI(){
        
        DispatchQueue.main.async(execute:{
            self.tablamia?.reloadData()
        })
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
