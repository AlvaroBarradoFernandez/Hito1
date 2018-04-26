//
//  micelda2CollectionViewCell.swift
//  Hito1
//
//  Created by Alvaro Barrado on 24/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

class micelda2CollectionViewCell: UICollectionViewCell {
    @IBOutlet var imgMain:UIImageView?
    @IBOutlet var lblNombre:UILabel?
    var ImagenDescargada:UIImage?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    /*
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    */
    func mostrarImagen(uri:String){
        self.imgMain?.image = nil
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
                self.imgMain?.image = self.ImagenDescargada
            }
        }
        
        //}
        
    }
}
