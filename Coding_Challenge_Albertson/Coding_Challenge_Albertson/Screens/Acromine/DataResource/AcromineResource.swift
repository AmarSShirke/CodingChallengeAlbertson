//
//  AcromineResource.swift
//  Coding_Challenge_Albertson
//
//  Created by Amar Shirke on 25/01/23.
//

import Foundation

final class AcromineResource
{
    // MARK :-  Call API
    func getAcromine(acromineRequest: AcromineRequest, completion: @escaping(_ result : Acromines?) -> Void)
    {
        let httpUtility = HttpUtility()

        let acromineEndpoint = "\(ApiEndpoints.acromine)?lf=\(acromineRequest.lf ?? "")&sf=\(acromineRequest.sf ?? "")"

        let requestUrl = URL(string:acromineEndpoint)!

        httpUtility.getApiData(requestUrl: requestUrl, resultType: Acromines.self) { (acromineApiResponse) in

            _ = completion(acromineApiResponse)
            
        }
    }
}
