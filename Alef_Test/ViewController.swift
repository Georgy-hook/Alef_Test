//
//  ViewController.swift
//  Alef_Test
//
//  Created by Georgy on 24.10.2022.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate,UITableViewDataSource {
    
    var itemsNames = [String]()
    var itemsAge = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! CustomCell
        if itemsNames.count>4{
            InsertChild.isHidden = true
        }
        else {
            InsertChild.isHidden = false
        }
        cell.DeleteButton.tag = indexPath.row
        cell.FieldName.text = itemsNames[indexPath.row]
        cell.FieldAge.text = itemsAge[indexPath.row]
        return cell
    }
    
    func addAlertForNewItem() {
        
        // Создание алёрт контроллера
        let alert = UIAlertController(title: "Добавление информации о ребенке", message: "Пожалуйста заполните поле", preferredStyle: .alert)
        
        // Создание текстового поля
        var alertTextFieldName: UITextField!
        var alertTextFieldAge: UITextField!
        alert.addTextField { textField in
            alertTextFieldName = textField
            textField.placeholder = "Имя"
        }
        alert.addTextField { textField in
            alertTextFieldAge = textField
            textField.placeholder = "Возраст"
        }
        // Создание кнопки для сохранения новых значений
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { action in
            
            // Проверяем не является ли текстовое поле пустым
            if (alertTextFieldName.text?.isEmpty == true) || (alertTextFieldAge.text?.isEmpty == true)  {
                print("The text field is empty") // Выводим сообщение на консоль, если поле не заполнено
                return
            }
            
            // Добавляем в массив новую задачу из текстового поля
            self.itemsNames.append((alertTextFieldName.text)!)
            self.itemsAge.append((alertTextFieldAge.text)!)
            
            // Обновляем таблицу
            self.ChildsTableView.reloadData()
        }
        // Создаем кнопку для отмены ввода новой задачи
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
        
        alert.addAction(saveAction) // Присваиваем алёрту кнопку для сохранения результата
        alert.addAction(cancelAction) // Присваиваем алерту кнопку для отмены ввода новой задачи
        
        present(alert, animated: true, completion: nil) // Вызываем алёрт контроллер
    }
    
    @IBOutlet weak var AgeTextField: CustomField!
    @IBOutlet weak var NameTextField: CustomField!
    
    
    @IBOutlet weak var ClearButton: UIButton!
    
    @IBOutlet weak var ChildsTableView: UITableView!
    @IBOutlet weak var InsertChild: UIButton!
    override func viewDidLoad() {
        
        NameTextField.labelText = "Имя"
        AgeTextField.labelText = "Возраст"
        ClearButton.layer.borderColor = UIColor.systemRed.cgColor
        InsertChild.layer.borderColor = UIColor.systemCyan.cgColor
        
        ChildsTableView.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func InsertInformation(_ sender: UIButton) {

        addAlertForNewItem()
        print(itemsNames)
        print(itemsAge)
    }
    
    @IBAction func DeleteRow(_ sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        itemsNames.remove(at: indexPath.row)
        itemsAge.remove(at: indexPath.row)
        let cell = ChildsTableView.cellForRow(at: indexPath) as? CustomCell
        ChildsTableView.deleteRows(at: [indexPath], with:.automatic)
        ChildsTableView.reloadData()
       

    }
    
    @IBAction func ClearAll(_ sender: UIButton) {
        
                let alert = UIAlertController(title: "Сброс данных", message: "Вы действительно хотите сбросить все данные?", preferredStyle: .actionSheet)
        
                alert.addAction(UIAlertAction(title: "Сбросить все", style: .destructive , handler:{ (UIAlertAction)in
                    self.NameTextField.text = ""
                    self.AgeTextField.text = ""
                        self.itemsNames.removeAll()
                        self.itemsAge.removeAll()
                        self.ChildsTableView.reloadData()
                }))
        
                alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler:{ (UIAlertAction)in
                }))
                self.present(alert, animated: true, completion: {
                    print("completion block")
                })
    }
    
}

