//
//  GameViewCell.swift
//  GameApi
//
//  Created by New Account on 10/20/21.
//

/*
 
 let id : Int
 let title : String
 let publisher : String
 let thumbnail : String
 let short_description : String
 let game_url : String
 let genre : String
 let platform : String
 let developer : String
 let release_date : String
 let freetogame_profile_url : String
 */

import UIKit

class GameViewCell: UITableViewCell {
    
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var pubisher : UILabel!
    @IBOutlet weak var thumbnail : UIImageView!
    @IBOutlet weak var short_description : UILabel!
    @IBOutlet weak var game_url : UILabel!
    @IBOutlet weak var genre : UILabel!
    @IBOutlet weak var platform : UILabel!
    @IBOutlet weak var developer : UILabel!
    @IBOutlet weak var release_date : UILabel!
    @IBOutlet weak var freetogame_profile_url : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
