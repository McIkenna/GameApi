//
//  ViewController.swift
//  GameApi
//
//  Created by New Account on 10/19/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{

    var myGameView : UITableView = UITableView()
    var fetchApi : FetchApi = FetchApi()
    var game : [Game] = []
    
    
        override func viewDidLoad() {
            
           // fetchApi.fetchApi{gameItem in self.game = gameItem}
            super.viewDidLoad()
           setUp()
            onloadingGame()
        }
    
    func onloadingGame(){
        fetchApi.fetchApi(completionHandler: {gameItem in
                self.game = gameItem
                DispatchQueue.main.async{
                    self.myGameView.reloadData()
                }
        })
    }
        
    func setUp(){
        self.view.addSubview(myGameView)
        myGameView.dataSource = self
        let gameCustomNib = UINib(nibName: "GameViewCell", bundle: nil)
        myGameView.register(gameCustomNib, forCellReuseIdentifier: "GameCell")
        myGameView.translatesAutoresizingMaskIntoConstraints = false
        myGameView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myGameView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myGameView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myGameView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.game.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameViewCell
            let gameObj = self.game[indexPath.row]
            cell.title.text = gameObj.title
            cell.pubisher.text = gameObj.publisher
            cell.developer.text = gameObj.developer
            cell.genre.text = gameObj.genre
            cell.short_description.text = gameObj.short_description
           // cell.freetogame_profile_url.text = gameObj.freetogame_profile_url
            //cell.game_url.text = gameObj.game_url
            cell.platform.text = gameObj.platform
            cell.release_date.text = gameObj.release_date
            let gameImageUrl = URL(string: (gameObj.thumbnail))!
            let gameImageData = try? Data(contentsOf: gameImageUrl)
            cell.thumbnail.image = UIImage(data: gameImageData!)
            
           // cell.detailTextLabel?.text = tableArray[indexPath.row].publisher
            return cell
        }


}

