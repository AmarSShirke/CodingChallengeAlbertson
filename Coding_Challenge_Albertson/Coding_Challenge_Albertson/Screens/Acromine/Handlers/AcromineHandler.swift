//
//  AcromineHandler.swift
//  Coding_Challenge_Albertson
//
//  Created by Amar Shirke on 29/01/23.
//

import Foundation

final class AcromineHandler {

    private let validation = AcromineValidation()
    private let acromineApiResource = AcromineResource()

    func findAcromine(request: AcromineRequest, completionHandler: @escaping(_ responseData: ResponseData?)->()) {

        let validationResult = validation.Validate(acromineRequest: request)
        if(validationResult.isValid) {
            
            acromineApiResource.getAcromine(acromineRequest: request) { result in
                completionHandler(ResponseData(errorMessage: nil, response: result))
            }
            
        }else{
            completionHandler(ResponseData(errorMessage: validationResult.message, response: nil))
        }

    }
}
