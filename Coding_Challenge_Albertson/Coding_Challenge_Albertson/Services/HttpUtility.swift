//
//  HttpUtility.swift
//  Coding_Challenge_Albertson
//
//  Created by Amar Shirke on 25/01/23.
//
import Foundation

struct HttpUtility
{
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                guard let response = httpUrlResponse as? HTTPURLResponse,
                      200 ... 299 ~= response.statusCode else {
                    return
                }
                
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _ = completionHandler(result)
                }catch let error{
                    debugPrint("error occured while decoding = \(error)")
                }
                
            }
        }.resume()
    }
    
}
