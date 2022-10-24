//
//  CustomCell.swift
//  Alef_Test
//
//  Created by Georgy on 24.10.2022.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var FieldName: CustomField!
    
    @IBOutlet weak var DeleteButton: UIButton!
    @IBOutlet weak var FieldAge: CustomField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        FieldName.labelText = "Имя"
        FieldAge.labelText = "Возраст"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
