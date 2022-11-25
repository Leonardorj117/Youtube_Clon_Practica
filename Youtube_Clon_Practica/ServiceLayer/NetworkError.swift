//
//  NetworkError.swift
//  Youtube_Clon_Practica
//
//  Created by Leonardo Rubio on 16/11/22.
//

import Foundation

enum NetworkError:String,Error{
    case invalidURL
    case serializationFailed
    case generic
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError = "ocurrio un error al tratar de consultar el Api: status code"
    case jsonDecoder = "Error al intentar extraer datos del json"
    case unauthorized
}
