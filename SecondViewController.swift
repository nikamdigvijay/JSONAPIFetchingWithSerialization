//
//  SecondViewController.swift
//  TaskFirstApi
//
//  Created by Digvijay Nikam on 22/11/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var SVCimage: UIImageView!
    @IBOutlet weak var SVCLabel1: UILabel!
    @IBOutlet weak var SVCLabel2: UILabel!
    @IBOutlet weak var SVCLabel3: UILabel!
    @IBOutlet weak var SVCLabel4: UILabel!
     
    var id : String?
    var email : String?
    var FirstName : String?
    var LastName : String?
    var Avatar = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SVCLabel1.text = id
        self.SVCLabel2.text = email
        self.SVCLabel3.text = FirstName
        self.SVCLabel4.text = LastName
        
        let urlFatched = NSURL(string: Avatar)
        SVCimage.sd_setImage(with: urlFatched as URL?)
        
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
