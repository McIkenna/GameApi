//
//  ViewController.swift
//  GameApi
//
//  Created by New Account on 10/19/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{

    @IBOutlet weak var tableValue : UITableView!
    var fetchApi = FetchApi()
    var tableArray = [Game]()
    
    {
        didSet{
            DispatchQueue.main.async {
                self.tableValue.reloadData()
            }
        }
    }
    
        override func viewDidLoad() {
            
            fetchApi.fetchApi{gameItem in self.tableArray = gameItem}
            super.viewDidLoad()
            tableValue.register(UITableViewCell.self, forCellReuseIdentifier: "dataTableCell")
            tableValue.dataSource = self
        }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.tableArray.count
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
        
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dataTableCell", for: indexPath)
            cell.textLabel?.text = tableArray[indexPath.row].title + " --> " + tableArray[indexPath.row].publisher
            
           
           // cell.detailTextLabel?.text = tableArray[indexPath.row].publisher
            return cell
        }


}

