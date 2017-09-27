//
//  ArticuloTableViewCell.swift
//  PerfectNews
//
//  Created by Alumno-DG on 22/09/17.
//  Copyright © 2017 Alumno-DG. All rights reserved.
//

import UIKit

class ArticuloTableViewCell: UITableViewCell {

    @IBOutlet weak var imgArtView: UIImageView!
    @IBOutlet weak var lblTituArt: UILabel!
    @IBOutlet weak var lblDescArt1: UILabel!
    @IBOutlet weak var lblAutorArt1: UILabel!
    
    var objArt : ArticuloBE!
    
    func actualizarData(){
        self.lblTituArt.text = "\(self.objArt.articulo_tituArt)"
        self.lblDescArt1.text = "\(self.objArt.articulo_descArt)"
        self.lblAutorArt1.text = "\(self.objArt.articulo_autArt)"
        
        CDMImageDownloaded.descargarImagen(enURL: self.objArt.articulo_imgUrlArt, paraImageView: self.imgArtView, conPlaceHolder: nil) { (esCorrecto, urlImagen, imagen) in
            if self.objArt.articulo_imgUrlArt == urlImagen{
                self.imgArtView.image = imagen
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
