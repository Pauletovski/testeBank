//
//  ViewController.swift
//  testSantander
//
//  Created by Paulo Lazarini on 31/05/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, DashboardManagerDelegate, InfosManagerDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nomeConta: UILabel!
    @IBOutlet weak var numeroConta: UILabel!
    @IBOutlet weak var saldoConta: UILabel!
    
    var dashboardManager = DashboardManager()
    
    var infosManager = InfosManager()
    
//    var getData = GetData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        dashboardManager.delegate = self
        dashboardManager.performRequest()
        
        infosManager.delegate = self
        infosManager.performRequest()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        
    }
    
    
    @IBAction func logoutButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    func didUpdateLogin(login: DashboardModel){
        DispatchQueue.main.async { [self] in
            nomeConta.text = login.nomeCliente
            numeroConta.text = login.numeroConta
            saldoConta.text = "R$ \(login.saldoConta)"
        }
    }

    func didUpdateInfo(info: InfosModel) {
        DispatchQueue.main.async { [self] in
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! TableViewCell
        return cell
    }
}

