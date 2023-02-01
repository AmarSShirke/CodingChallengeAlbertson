//
//  AcromineValidation.swift
//  Coding_Challenge_Albertson
//
//  Created by Amar Shirke on 25/01/23.
//

import Foundation


final class AcromineValidation {
    // MARK :-  Check validation
    func Validate(acromineRequest: AcromineRequest) -> AcromineValidationResult
    {
        let searchText = acromineRequest.sf ?? ""
    
        if searchText.containsNumbers || searchText.hasPrefix(" ")
        {
            return AcromineValidationResult(isValid: false, message: StringMessage.validInputStr)
        }
    
        return AcromineValidationResult(isValid: true, message: nil)
    }

}
