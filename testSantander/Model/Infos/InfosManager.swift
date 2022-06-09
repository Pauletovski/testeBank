//
//  InfosManager.swift
//  testSantander
//
//  Created by Paulo Lazarini on 08/06/22.
//

import Foundation

protocol InfosManagerDelegate{
    func didUpdateInfo(info: InfosModel)
}

struct InfosManager {

    var delegate: InfosManagerDelegate?
    
    func performRequest() {
        
        if let url = URL(string: "https://60bd336db8ab3700175a03b3.mockapi.io/treinamento/payments") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error.debugDescription)
                    return
                }
                if let safeData = data {
                    if let info = self.parseJSON(infosData: safeData){
                        delegate?.didUpdateInfo(info: info)
                    }
                }
                
            }
            task.resume()
        }
    }
    func parseJSON (infosData: Data) -> InfosModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([InfosData].self, from: infosData)
            let valor = decodedData[0].paymentDate
            let contaLuz = decodedData[0].electricityBill
            let id = decodedData[0].id
            
            let infos = InfosModel(valorConta: valor, contaDeLuz: contaLuz, id: id)
            
            return infos
        } catch {
            print(error)
            return nil
        }
    }
}
