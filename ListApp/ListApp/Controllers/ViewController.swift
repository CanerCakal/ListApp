//
//  ViewController.swift
//  ListApp
//
//  Created by Caner Çakal on 2.02.2026.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView : UITableView!
    
    let data = ["Swift", "C++", "C", "C#", "Python", "Java", "Ruby", "Go", "PHP"]

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

}

