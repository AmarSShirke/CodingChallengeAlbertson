//
//  AcromineResponseModel.swift
//  Coding_Challenge_Albertson
//
//  Created by Amar Shirke on 25/01/23.
//

import Foundation

// MARK :- Response Model
struct AcromineResponseModel: Decodable {
    let sf: String
    let lfs: [Acromine]
}

struct Acromine: Decodable {
    let lf: String
    let freq, since: Int
    let vars: [Acromine]?
}

typealias Acromines = [AcromineResponseModel]
