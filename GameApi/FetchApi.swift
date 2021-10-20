//
//  FetchApi.swift
//  GameApi
//
//  Created by New Account on 10/19/21.
//
import UIKit
import Foundation
class FetchApi{
    func fetchApi(completionHandler:@escaping ([Game]) -> Void){
        let url = URL(string: "https://www.freetogame.com/api/games")!
        let task = URLSession.shared.dataTask(with: url, completionHandler:  {(data, response, error) in
            
            if error != nil || data == nil {
                print("Error---- \(String(describing: error?.localizedDescription))")
            }
            else {
               if let responseText = String.init(data: data!, encoding: .ascii)
                {
                    let jsonData = responseText.data(using: .utf8)!
                    let games = try! JSONDecoder().decode([Game].self, from: jsonData)
                    completionHandler(games)
                }
            }
            })
            task.resume()
            
    }
}

