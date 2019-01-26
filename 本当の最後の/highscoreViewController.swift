//
//  highscoreViewController.swift
//  本当の最後の
//
//  Created by 村上治衣 on 2019/01/26.
//  Copyright © 2019 EriyaMurakami. All rights reserved.
//

import UIKit

class highscoreViewController: UIViewController {
    
    @IBOutlet var pointLabel: UILabel!
    
    let saveDate: UserDefaults = UserDefaults.standard
    var userName: String!
    var userPoint: String!

  
    override func viewDidLoad() {
        super.viewDidLoad()
        pointLabel.text = userPoint

        // Do any additional setup after loading the view.¥
        userName = saveDate.object(forKey: "Name") as! String
        userPoint = saveDate.object(forKey: "point") as! String
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
