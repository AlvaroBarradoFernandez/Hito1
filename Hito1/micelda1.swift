//
//  micelda1.swift
//  Hito1
//
//  Created by Alvaro Barrado on 5/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit



class micelda1: UITableViewCell {
@IBOutlet var miLabel:UILabel?
@IBOutlet var miImagen:UIImageView?
    var ImagenDescargada:UIImage?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func mostrarImagen(uri:String){
        self.miImagen?.image = nil
        let imagenDes = DataHolder.sharedInstance.HMIMG[uri]
        if imagenDes != nil{
            miImagen?.image = imagenDes
        }else{
       // if ImagenDescargada == nil{
            // Create a reference to the file you want to download
            let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
            // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
            gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if error != nil {
                    // Uh-oh, an error occurred!
                } else {
                    // Data for "images/island.jpg" is returned
                    //let image = UIImage(data: data!)
                    self.ImagenDescargada = UIImage(data: data!)
                    self.miImagen?.image = self.ImagenDescargada
                    DataHolder.sharedInstance.HMIMG[uri] = self.ImagenDescargada
                }
            }
        }
        //}
    }
}
