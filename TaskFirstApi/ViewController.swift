//
//  ViewController.swift
//  TaskFirstApi
//
//  Created by Digvijay Nikam on 19/11/22.
//

import UIKit
import SDWebImage
class ViewController: UIViewController {
    @IBOutlet weak var tabelToDisplayUsers: UITableView!
    
    var users = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fatchinDataFromApi()
        initDataAndDelegate()
        registerNib()
        tabelToDisplayUsers.backgroundColor = .gray
    }
    func initDataAndDelegate(){
        tabelToDisplayUsers.dataSource = self
        tabelToDisplayUsers.delegate = self
    }
    
    func registerNib(){
        let uiNib = UINib(nibName: "TaskTableViewCell", bundle: nil)
        tabelToDisplayUsers.register(uiNib, forCellReuseIdentifier: "TaskTableViewCell")
    }
    
     func fatchinDataFromApi(){
        let urlString = "https://reqres.in/api/users?page=2"
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        
        var dataTask = session.dataTask(with: request) { data,response, error in
           // print("data\(data)")
            print("responce\(response)")
            
            
            let getJSONObject = try! JSONSerialization.jsonObject(with: data!) as! [String:Any]
            
            var dataArrayFromJson = NSArray()
            dataArrayFromJson = getJSONObject["data"] as! NSArray
            print(dataArrayFromJson)
            
            for dictionary in dataArrayFromJson
            {
                let eachDictionary = dictionary as! [String:Any]
                print(eachDictionary)
                let userId = eachDictionary["id"] as! Int
                let userEmail = eachDictionary["email"] as! String
                let userFirstname = eachDictionary["first_name"] as! String
                let userLastname = eachDictionary["last_name"] as! String
                let userAvatar = eachDictionary["avatar"] as! String
                
                let newuser = Data(id: userId, email: userEmail, FirstName: userEmail, LastName: userLastname, avatar: userAvatar)
                self.users.append(newuser)
                
            }
            DispatchQueue.main.async {
                self.tabelToDisplayUsers.reloadData()
            }
        }
        dataTask.resume()
    }
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tabelToDisplayUsers.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        
        let imageurl = NSURL(string: users[indexPath.row].avatar)
        cell.uiImage.sd_setImage(with: imageurl as URL?)
        
        cell.Label1.text = String(users[indexPath.row].id)
        cell.Label2.text = users[indexPath.row].FirstName
        cell.Label3.text = users[indexPath.row].LastName
        cell.Label4.text = users[indexPath.row].email
        cell.Label1.textColor = .orange
        cell.Label2.textColor = .orange
        cell.Label3.textColor = .orange
        cell.Label4.textColor = .orange
       // cell.uiImage.image = UIImage(named: users[indexPath.row].avatar)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        secondVC.id = String(users[indexPath.row].id)
        secondVC.email = users[indexPath.row].email
        secondVC.FirstName = users[indexPath.row].FirstName
        secondVC.LastName = users[indexPath.row].LastName
        secondVC.Avatar = users[indexPath.row].avatar
        
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}

