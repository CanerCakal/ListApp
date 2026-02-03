//
//  ViewController.swift
//  ListApp
//
//  Created by Caner Çakal on 2.02.2026.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView : UITableView!
    
    var alertController = UIAlertController()
    
    var data = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       /* let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row]
        return cell */ // Bu şekil kullanımda tableView da oluşturulan değişiklik olmayacaktı.
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        // Custom bir cell oluştursaydım cast işlemi yapılması gerekiyordu. (as)
        
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    @IBAction func didAddBarButtonItemTapped (_ sender: UIBarButtonItem) {
        
        presentAddAlert()
    }
    
    @IBAction func didRemoveBarButtonItemTapped (_ sender: UIBarButtonItem) {
        presentAlert(title: "Uyarı",
                     message: "Listedeki tüm öğeleri silmek istediğinize emin misin?",
                     defaultButtonTitle: "Evet",
                     cancelButtonTitle: "Vazgeç") {_ in
            self.data.removeAll()
            self.tableView.reloadData()
        }
    }
    
    func presentAddAlert() {
        presentAlert(title:"Yeni eleman ekleme",
                     message: nil,
                     defaultButtonTitle: "Ekle",
                     cancelButtonTitle: "Vazgeç",
                     isTextFieldAvailable: true) { _ in
            let text = self.alertController.textFields?.first?.text
            if text != "" {
                self.data.append((text)!)
                self.tableView.reloadData()
            } else {
                self.presentWarningAlert()
            }
        }
    }
    
    func presentWarningAlert() {
        presentAlert(title: "Uyarı!",
                     message: "Liste Elemanı boş olamaz.",
                     cancelButtonTitle: "Tamam")
    }

    
    func presentAlert(title: String?,
                      message: String?,
                      preferredStyle: UIAlertController.Style = .alert,
                      defaultButtonTitle: String? = nil,
                      cancelButtonTitle: String?,
                      isTextFieldAvailable: Bool = false,
                      defaultButtonHandler: ((UIAlertAction) -> Void)? = nil) {
        
        alertController = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: preferredStyle)
        if defaultButtonTitle != nil {
            let defaultButton = UIAlertAction(title: defaultButtonTitle,
                                              style: .default,
                                              handler: defaultButtonHandler)
            alertController.addAction(defaultButton)
        }
        
        let cancelButton = UIAlertAction(title: cancelButtonTitle,
                                         style: .cancel,
                                         handler: nil)
        if isTextFieldAvailable {
            alertController.addTextField()
        }
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }
}

