//
//  ArticuloBE.swift
//  PerfectNews
//
//  Created by Alumno-DG on 22/09/17.
//  Copyright © 2017 Alumno-DG. All rights reserved.
//

import UIKit

class ArticuloBE: NSObject {
    
    var articulo_tituArt    = ""
    var articulo_descArt    = ""
    var articulo_autArt     = ""
    var articulo_urlArt     = ""
    var articulo_imgUrlArt  = ""
    
    
    class func parse(_ objDic : [String : Any]) -> ArticuloBE{
        
        let objBE = ArticuloBE()
        
        objBE.articulo_tituArt = CDMWebResponse.getString(objDic["title"])
        
        return objBE
    }
    
}
