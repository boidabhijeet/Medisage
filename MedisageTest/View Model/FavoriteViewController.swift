//
//  FavoriteViewController.swift
//  MedisageTest
//
//  Created by Abhi on 22/08/21.
//

import UIKit

class FavoriteViewController: UIViewController {

    var addedFavorites : [MedisageTestEntity] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var favTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       getAllItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getAllItems()
    }
    func getAllItems(){
        do{
            addedFavorites = try context.fetch(MedisageTestEntity.fetchRequest())
            DispatchQueue.main.async {
                self.favTableView.reloadData()
            }
        }catch{
            //error
        }
    }
}

extension FavoriteViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        addedFavorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell")
        cell?.textLabel!.text = addedFavorites[indexPath.row].title
        cell?.detailTextLabel?.text = addedFavorites[indexPath.row].body
        return cell!
    }
    
    
}
