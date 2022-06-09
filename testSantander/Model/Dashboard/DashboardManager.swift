////
////  LoginManager.swift
////  testSantander
////
////  Created by Paulo Lazarini on 23/05/22.
////

import UIKit
import Alamofire

protocol DashboardManagerDelegate{
    func didUpdateLogin(login: DashboardModel)
}

struct DashboardManager {

    var delegate: DashboardManagerDelegate?
    
    func performRequest() {
        
        if let url = URL(string: "https://60bd336db8ab3700175a03b3.mockapi.io/treinamento/Login") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error.debugDescription)
                    return
                }
                if let safeData = data {
                    if let login = self.parseJSON(loginData: safeData){
                        delegate?.didUpdateLogin(login: login)
                    }
                }
                
            }
            task.resume()
        }
    }
    func parseJSON (loginData: Data) -> DashboardModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([DashboardData].self, from: loginData)
            let nome = decodedData[0].customerName
            let numConta = decodedData[0].accountNumber
            let agencia = decodedData[0].branchNumber
            let id = decodedData[0].id
            let saldo = decodedData[0].checkingAccountBalance
            
            let login = DashboardModel(nomeCliente: nome, numeroConta: numConta, branchNumber: agencia, saldoConta: saldo, id: id)
            
            return login
        } catch {
            print(error)
            return nil
        }
    }
}


