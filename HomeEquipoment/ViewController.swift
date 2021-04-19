//
//  ViewController.swift
//  HomeEquipoment
//
//  Created by Ndayisenga Jean Claude on 19/04/2021.
//

import UIKit

class HomeEquipoment {
    let title: String
    var isChecked: Bool = false
    init(title: String) {
        self.title = title
    }
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let items: [HomeEquipoment] = [
        "Television",
        "Apple computer",
        "Iphone x Max Pro",
        "Rubiks cube",
        "Samsung Phone",
        "AirPods",
        "JBL heaphone",
        "JBL speaker"
    ].compactMap({HomeEquipoment(title: $0)
        
    })
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MY HOME DEVICES"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource =  self
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // Tbale
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = item.title
        cell.textLabel?.textColor = .blue
        cell.textLabel?.textAlignment = .justified
        cell.accessoryType = item.isChecked ?.checkmark: .none
        return cell
    }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        item.isChecked = !item.isChecked
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }


}

