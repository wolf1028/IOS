//
//  ArticuloWS.swift
//  PerfectNews
//
//  Created by Alumno on 23/09/17.
//  Copyright © 2017 Alumno-DG. All rights reserved.
//

import UIKit

class ArticuloWS: NSObject {

    class func getListaArticlesWithSuccess(_ success : @escaping (_ arrayArticles : [ArticuloBE]) -> Void) {
        
        let baseUrl = "https://newsapi.org"
        let path = "v1/articles?source=cnn&sortBy=top&apiKey=493594c4b4ac4280bcea75382090410c"
        
        CDMWebSender.doGETToURL(baseUrl, withPath: path, withParameter: nil) { (objRespuesta) in
            
            let diccionarioRespuesta = CDMWebResponse.getDictionary(objRespuesta.JSON)
            let arrayArticulos = CDMWebResponse.getArrayDictionary(diccionarioRespuesta["articles"])
            
            var arrayArticulosFinal = [ArticuloBE]()
            
            for obj in arrayArticulos {
                
                arrayArticulosFinal.append(ArticuloBE.parse(obj))
            }
            
            success(arrayArticulosFinal)
            
        }
    }
    
}
