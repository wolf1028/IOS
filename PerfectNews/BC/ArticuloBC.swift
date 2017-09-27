//
//  ArticuloBC.swift
//  PerfectNews
//
//  Created by Alumno-DG on 26/09/17.
//  Copyright © 2017 Alumno-DG. All rights reserved.
//

import UIKit

class ArticuloBC: NSObject {
    
    
    class func fetchArticulos() -> Void {
        var articles : [ArticuloBE] = []
        ArticuloWS.getListaArticlesWithSuccess { (array) in
             articles = array
        }
    }
    
}
