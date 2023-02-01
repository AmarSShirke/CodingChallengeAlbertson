//
//  ResponseModel.swift
//  Coding_Challenge_Albertson
//
//  Created by Amar Shirke on 29/01/23.
//

import Foundation

// MARK :- Data Response Model
struct ResponseData: Decodable {
    let errorMessage: String?
    let response: Acromines?
}
