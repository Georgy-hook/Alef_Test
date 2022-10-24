//
//  CustomField.swift
//  Alef_Test
//
//  Created by Georgy on 24.10.2022.
//

import UIKit

class CustomField: UITextField {
    public var labelText: String?
   
            var topLabel: UILabel = {
           
                let topLabel = UILabel()
                topLabel.translatesAutoresizingMaskIntoConstraints = false
                topLabel.textAlignment = .left
                topLabel.font = UIFont.systemFont(ofSize: 12)
                topLabel.textColor = .lightGray
                topLabel.backgroundColor = .white
                topLabel.numberOfLines = 1
                return topLabel
        
            }()

            func setupLabel() {
        
                self.addSubview(topLabel)
                topLabel.text = labelText
                if labelText == "Имя"{
                    topLabel.centerYAnchor.constraint(equalTo: self.topAnchor).isActive = true
                    topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
                }
                else {
                    topLabel.centerYAnchor.constraint(equalTo: self.topAnchor).isActive = true
                    topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
                }
        
            }
    override func draw(_ rect: CGRect) {
        setupLabel()
    }
    

}
