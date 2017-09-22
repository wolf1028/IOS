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
    @IBOutlet weak var lblDescArt: UILabel!
    @IBOutlet weak var lblAutorArt: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
