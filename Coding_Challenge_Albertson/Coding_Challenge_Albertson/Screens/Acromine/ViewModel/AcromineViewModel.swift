//
//  AcromineViewModel.swift
//  Coding_Challenge_Albertson
//
//  Created by Amar Shirke on 25/01/23.
//

import Foundation


class AcromineViewModel
{
    // MARK: - Variables
    var eventHandler: ((_ event: Event) -> Void)?
    var acromineDataArray : [Acromine]? = nil
    
    // MARK: - ViewModel Method
    func getAcromines(lf: String, sf: String)
    {
        self.eventHandler?(.loading)
        
        let acromineRequest = AcromineRequest(lf: lf, sf: sf)
        let acromineHandler = AcromineHandler()
        
        acromineHandler.findAcromine(request: acromineRequest) { responseData in
            self.eventHandler?(.stopLoading)
            
            if responseData?.response?.count ?? 0 > 0{
                self.acromineDataArray = responseData?.response?[0].lfs
                self.eventHandler?(.dataLoaded)
            }else{
                self.eventHandler?(.error(responseData?.errorMessage ?? nil))
                self.acromineDataArray = []
            }
        
        }
    }
}

extension AcromineViewModel {

    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(String?)
    }

}
