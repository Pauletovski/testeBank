//
//  TableViewCell.swift
//  testSantander
//
//  Created by Paulo Lazarini on 08/06/22.
//

import UIKit

class TableViewCell: UITableViewCell, InfosManagerDelegate{
    
    var infosManager = InfosManager()
    
    func didUpdateInfo(info: InfosModel) {
        DispatchQueue.main.async { [self] in
            valorConta.text = info.contaDeLuz
            paymentDate.text = info.valorConta
        }
    }
    
    
    
    @IBOutlet weak var paymentDate: UILabel!
    @IBOutlet weak var contaDeLuz: UILabel!
    @IBOutlet weak var valorConta: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        infosManager.delegate = self
        infosManager.performRequest()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
