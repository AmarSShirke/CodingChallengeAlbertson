//
//  String + Extension.swift
//  Coding_Challenge_Albertson
//
//  Created by Amar Shirke on 29/01/23.
//

import Foundation

extension String
{
    var containsNumbers: Bool {
       let regex = ".*[0-9].*"
       let string = NSPredicate(format:"SELF MATCHES %@", regex)
       return string.evaluate(with: self)
    }
    
}
